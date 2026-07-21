#!/usr/bin/env python3
"""Validate scripted style fixes for Git add-on DITA topics."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Dict, List
import xml.etree.ElementTree as ET


FORBIDDEN_PATTERNS = [
    "amount of characters",
    "contextual menu",
    "Contextual Menu",
    "<b>></b>",
]

REPORT_ONLY_PATTERNS = {
    "resolve_conflict_label": ["Resolve conflict", "Resolve Conflict"],
    "heading_case_review": ["<title>Create a new branch</title>"],
    "index_keyword_review": ["git-addon-up-to-date.dita"],
    "unresolved_review_comments": ["<?oxy_comment_start"],
    "compare_editor_terminology_review": ["<uicontrol>Diff File</uicontrol>", "<uicontrol>compare editor</uicontrol>", "<uicontrol>Compare Editor</uicontrol>"],
    "positron_ai_assistant_review": ["Positron AI Assistant"],
}

EXPECTED_TERMINOLOGY_RULES = {
    "resolve_conflict_to_conref": "Resolve conflict"
}


def get_workspace_root(project_root: Path) -> Path:
    return project_root.parent.parent


def resolve_scope_paths(project_root: Path) -> List[Path]:
    workspace_root = get_workspace_root(project_root)
    dita_addons_root = workspace_root / "DITA-addons"
    return sorted(dita_addons_root.glob("add-ons/git-addon*.dita"))


def validate_xml(file_path: Path) -> List[str]:
    errors: List[str] = []
    try:
        ET.parse(file_path)
    except ET.ParseError as exc:
        errors.append(f"XML parse error: {exc}")
    return errors


def scan_patterns(file_path: Path, content: str) -> Dict[str, List[str]]:
    findings: Dict[str, List[str]] = {"forbidden": [], "report_only": []}

    for pattern in FORBIDDEN_PATTERNS:
        if pattern in content:
            findings["forbidden"].append(pattern)

    for rule_id, patterns in REPORT_ONLY_PATTERNS.items():
        for pattern in patterns:
            if pattern in content or pattern == file_path.name:
                findings["report_only"].append(f"{rule_id}: {pattern}")

    return findings


def main() -> int:
    parser = argparse.ArgumentParser(description="Validate Git add-on style fixes.")
    parser.add_argument("--project-root", required=True, help="Path to the positron-ai-actions project root.")
    parser.add_argument("--report", required=True, help="Path to the fixer JSON report.")
    parser.add_argument("--output", required=True, help="Path to the validation JSON output.")
    args = parser.parse_args()

    project_root = Path(args.project_root).resolve()
    fixer_report_path = Path(args.report).resolve()
    output_path = Path(args.output).resolve()

    fixer_report = json.loads(fixer_report_path.read_text(encoding="utf-8"))
    files = resolve_scope_paths(project_root)

    validation_results = []
    has_errors = False

    for file_path in files:
        content = file_path.read_text(encoding="utf-8")
        xml_errors = validate_xml(file_path)
        findings = scan_patterns(file_path, content)
        if xml_errors or findings["forbidden"]:
            has_errors = True
        validation_results.append(
            {
                "file": str(file_path),
                "xml_errors": xml_errors,
                "forbidden_patterns_found": findings["forbidden"],
                "report_only_findings": findings["report_only"],
            }
        )

    terminology_expectations = {}
    applied_rules = fixer_report.get("summary", {}).get("applied_rules", {})
    preferred_resolve_conflict_term = fixer_report.get("summary", {}).get("preferred_resolve_conflict_term")
    if preferred_resolve_conflict_term and applied_rules.get("resolve_conflict_to_conref", 0) >= 0:
        terminology_expectations["resolve_conflict_to_conref"] = preferred_resolve_conflict_term

    output = {
        "fixer_summary": fixer_report.get("summary", {}),
        "validation_summary": {
            "files_checked": len(validation_results),
            "has_errors": has_errors,
            "terminology_files_discovered": fixer_report.get("summary", {}).get("terminology_files_discovered", []),
            "terminology_terms_indexed": fixer_report.get("summary", {}).get("terminology_terms_indexed", 0),
            "terminology_expectations": terminology_expectations
        },
        "files": validation_results,
    }

    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(json.dumps(output, indent=2), encoding="utf-8")

    print(json.dumps(output["validation_summary"], indent=2))
    return 1 if has_errors else 0


if __name__ == "__main__":
    raise SystemExit(main())
