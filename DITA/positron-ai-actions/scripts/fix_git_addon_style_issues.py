#!/usr/bin/env python3
"""Apply scripted style fixes to Git add-on DITA topics.

This script performs a conservative first pass over files that match the
configured Git add-on scope. It applies only deterministic replacements,
discovers terminology sources from configured DITA maps, prioritizes Git add-on
terminology over shared reusables, and writes a JSON report that can be
reviewed by a validator script.
"""

from __future__ import annotations

import argparse
import json
import re
import xml.etree.ElementTree as ET
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Set, Tuple


@dataclass
class RuleResult:
    rule_id: str
    replacements: int


@dataclass
class FileResult:
    file: str
    changed: bool
    rule_results: List[RuleResult]


@dataclass
class TerminologyEntry:
    text: str
    file: str
    topic_id: str
    element_id: str
    source_priority: int


def load_manifest(manifest_path: Path) -> Dict:
    return json.loads(manifest_path.read_text(encoding="utf-8"))


def get_workspace_root(project_root: Path) -> Path:
    return project_root.parent.parent


def resolve_scope_paths(project_root: Path, scope_glob: str) -> List[Path]:
    workspace_root = get_workspace_root(project_root)
    dita_addons_root = workspace_root / "DITA-addons"
    return sorted(dita_addons_root.glob("add-ons/git-addon*.dita"))


def resolve_project_relative_path(project_root: Path, relative_path: str) -> Path:
    workspace_root = get_workspace_root(project_root)
    return (workspace_root / relative_path).resolve()


def get_source_priority(path: Path) -> int:
    path_str = str(path).replace("\\", "/")
    if "/DITA-addons/add-ons/" in path_str:
        return 1
    if "/DITA/reusables/" in path_str:
        return 2
    return 99


def is_local_dita_href(href: str) -> bool:
    href_lower = href.lower()
    if href_lower.startswith("http:") or href_lower.startswith("https:"):
        return False
    if "://" in href_lower:
        return False
    return href_lower.endswith(".dita")


def discover_terminology_sources(project_root: Path, manifest: Dict) -> List[Path]:
    terminology_config = manifest.get("terminology", {})
    if not terminology_config.get("discover_from_ditamaps", False):
        return []

    discovered: Set[Path] = set()
    for ditamap_rel in terminology_config.get("ditamaps", []):
        ditamap_path = resolve_project_relative_path(project_root, ditamap_rel)
        if not ditamap_path.exists():
            continue
        try:
            tree = ET.parse(ditamap_path)
        except ET.ParseError:
            continue
        root = tree.getroot()
        for elem in root.iter():
            href = elem.attrib.get("href")
            processing_role = elem.attrib.get("processing-role")
            if not href or not is_local_dita_href(href):
                continue
            if elem.tag == "keydef":
                discovered.add((ditamap_path.parent / href).resolve())
            elif elem.tag == "topicref" and processing_role == "resource-only":
                discovered.add((ditamap_path.parent / href).resolve())
    return sorted(discovered, key=get_source_priority)


def build_terminology_index(terminology_files: List[Path]) -> Dict[str, List[TerminologyEntry]]:
    index: Dict[str, List[TerminologyEntry]] = {}
    for file_path in terminology_files:
        if not file_path.exists() or file_path.suffix != ".dita":
            continue
        try:
            tree = ET.parse(file_path)
        except ET.ParseError:
            continue
        root = tree.getroot()
        topic_id = root.attrib.get("id", "")
        source_priority = get_source_priority(file_path)
        for elem in root.iter():
            elem_id = elem.attrib.get("id")
            text = "".join(elem.itertext()).strip()
            if elem_id and text:
                entry = TerminologyEntry(
                    text=text,
                    file=str(file_path),
                    topic_id=topic_id,
                    element_id=elem_id,
                    source_priority=source_priority,
                )
                index.setdefault(text, []).append(entry)

    for text, entries in index.items():
        entries.sort(key=lambda e: (e.source_priority, e.file, e.element_id))
    return index


def find_preferred_term(terminology_index: Dict[str, List[TerminologyEntry]], text: str) -> Optional[TerminologyEntry]:
    entries = terminology_index.get(text, [])
    return entries[0] if entries else None


def apply_literal_rule(content: str, rule: Dict) -> Tuple[str, int]:
    count = content.count(rule["find"])
    if count:
        content = content.replace(rule["find"], rule["replace"])
    return content, count


def apply_regex_rule(content: str, rule: Dict) -> Tuple[str, int]:
    pattern = re.compile(rule["pattern"], flags=re.MULTILINE)
    content, count = pattern.subn(rule["replace"], content)
    return content, count


def apply_resolve_conflict_term_rule(content: str, terminology_index: Dict[str, List[TerminologyEntry]]) -> Tuple[str, int]:
    preferred = find_preferred_term(terminology_index, "Resolve conflict")
    if not preferred:
        return content, 0

    target_file = Path(preferred.file).name
    replacement = (
        f'<uicontrol conref="{target_file}#{preferred.topic_id}/{preferred.element_id}"/>'
    )

    pattern = re.compile(r"<uicontrol(?:\s+[^>]*)?>\s*Resolve conflict\s*</uicontrol>", flags=re.MULTILINE)
    content, count = pattern.subn(replacement, content)
    return content, count


def apply_rules_to_file(file_path: Path, manifest: Dict, terminology_index: Dict[str, List[TerminologyEntry]], dry_run: bool) -> FileResult:
    original = file_path.read_text(encoding="utf-8")
    updated = original
    rule_results: List[RuleResult] = []

    for rule in manifest.get("language_rules", []):
        if not rule.get("enabled", False):
            continue
        if rule["type"] == "literal_replace":
            updated, count = apply_literal_rule(updated, rule)
        else:
            updated, count = apply_regex_rule(updated, rule)
        if count:
            rule_results.append(RuleResult(rule_id=rule["id"], replacements=count))

    for rule in manifest.get("markup_rules", []):
        if not rule.get("enabled", False):
            continue
        updated, count = apply_regex_rule(updated, rule)
        if count:
            rule_results.append(RuleResult(rule_id=rule["id"], replacements=count))

    updated, count = apply_resolve_conflict_term_rule(updated, terminology_index)
    if count:
        rule_results.append(RuleResult(rule_id="resolve_conflict_to_conref", replacements=count))

    changed = updated != original
    if changed and not dry_run:
        file_path.write_text(updated, encoding="utf-8")

    return FileResult(
        file=str(file_path),
        changed=changed,
        rule_results=rule_results,
    )


def build_report(results: List[FileResult], manifest: Dict, terminology_files: List[Path], terminology_index: Dict[str, List[TerminologyEntry]]) -> Dict:
    changed_files = [r.file for r in results if r.changed]
    applied_rules: Dict[str, int] = {}
    for result in results:
        for rule_result in result.rule_results:
            applied_rules[rule_result.rule_id] = applied_rules.get(rule_result.rule_id, 0) + rule_result.replacements

    preferred_resolve_conflict = find_preferred_term(terminology_index, "Resolve conflict")

    return {
        "summary": {
            "files_scanned": len(results),
            "files_changed": len(changed_files),
            "changed_files": changed_files,
            "applied_rules": applied_rules,
            "terminology_files_discovered": [str(p) for p in terminology_files],
            "terminology_terms_indexed": len(terminology_index),
            "preferred_resolve_conflict_term": None if not preferred_resolve_conflict else {
                "file": preferred_resolve_conflict.file,
                "topic_id": preferred_resolve_conflict.topic_id,
                "element_id": preferred_resolve_conflict.element_id,
                "source_priority": preferred_resolve_conflict.source_priority,
            },
        },
        "files": [
            {
                "file": result.file,
                "changed": result.changed,
                "rule_results": [
                    {"rule_id": rr.rule_id, "replacements": rr.replacements}
                    for rr in result.rule_results
                ],
            }
            for result in results
        ],
        "report_only_rules": manifest.get("report_only_rules", []),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Fix Git add-on style issues.")
    parser.add_argument("--project-root", required=True, help="Path to the positron-ai-actions project root.")
    parser.add_argument("--manifest", required=True, help="Path to the JSON rule manifest.")
    parser.add_argument("--report", required=True, help="Path to the JSON report file to write.")
    parser.add_argument("--dry-run", action="store_true", help="Compute changes without writing files.")
    args = parser.parse_args()

    project_root = Path(args.project_root).resolve()
    manifest_path = Path(args.manifest).resolve()
    report_path = Path(args.report).resolve()

    manifest = load_manifest(manifest_path)
    scope_glob = manifest.get("scope", {}).get("glob", "")
    files = resolve_scope_paths(project_root, scope_glob)
    terminology_files = discover_terminology_sources(project_root, manifest)
    terminology_index = build_terminology_index(terminology_files)

    results = [apply_rules_to_file(file_path, manifest, terminology_index, args.dry_run) for file_path in files]
    report = build_report(results, manifest, terminology_files, terminology_index)

    report_path.parent.mkdir(parents=True, exist_ok=True)
    report_path.write_text(json.dumps(report, indent=2), encoding="utf-8")

    print(json.dumps(report["summary"], indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
