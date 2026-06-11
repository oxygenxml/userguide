#!/usr/bin/env python3
"""Apply scripted style fixes to Git add-on DITA topics.

This script performs a conservative first pass over files that match the
configured Git add-on scope. It applies only deterministic replacements and
writes a JSON report that can be reviewed by a validator script.
"""

from __future__ import annotations

import argparse
import json
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Tuple


@dataclass
class RuleResult:
    rule_id: str
    replacements: int


@dataclass
class FileResult:
    file: str
    changed: bool
    rule_results: List[RuleResult]


def load_manifest(manifest_path: Path) -> Dict:
    return json.loads(manifest_path.read_text(encoding="utf-8"))


def resolve_scope_paths(project_root: Path, scope_glob: str) -> List[Path]:
    dita_addons_root = project_root.parent / "DITA-addons"
    return sorted(dita_addons_root.glob("add-ons/git-addon*.dita"))


def apply_literal_rule(content: str, rule: Dict) -> Tuple[str, int]:
    count = content.count(rule["find"])
    if count:
        content = content.replace(rule["find"], rule["replace"])
    return content, count


def apply_regex_rule(content: str, rule: Dict) -> Tuple[str, int]:
    pattern = re.compile(rule["pattern"], flags=re.MULTILINE)
    content, count = pattern.subn(rule["replace"], content)
    return content, count


def apply_rules_to_file(file_path: Path, manifest: Dict, dry_run: bool) -> FileResult:
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

    changed = updated != original
    if changed and not dry_run:
        file_path.write_text(updated, encoding="utf-8")

    return FileResult(
        file=str(file_path),
        changed=changed,
        rule_results=rule_results,
    )


def build_report(results: List[FileResult], manifest: Dict) -> Dict:
    changed_files = [r.file for r in results if r.changed]
    applied_rules: Dict[str, int] = {}
    for result in results:
        for rule_result in result.rule_results:
            applied_rules[rule_result.rule_id] = applied_rules.get(rule_result.rule_id, 0) + rule_result.replacements

    return {
        "summary": {
            "files_scanned": len(results),
            "files_changed": len(changed_files),
            "changed_files": changed_files,
            "applied_rules": applied_rules,
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

    results = [apply_rules_to_file(file_path, manifest, args.dry_run) for file_path in files]
    report = build_report(results, manifest)

    report_path.parent.mkdir(parents=True, exist_ok=True)
    report_path.write_text(json.dumps(report, indent=2), encoding="utf-8")

    print(json.dumps(report["summary"], indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
