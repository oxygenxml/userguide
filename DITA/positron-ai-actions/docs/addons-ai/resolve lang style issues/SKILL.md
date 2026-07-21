---
name: Address language style issues
description: Use this skill to assign safe language-style fixes in the Git add-on documentation to a script, run the script, and verify the results.
---

# Address language style issues

## Purpose

Use this skill to fix language style issues according to the project or company style guide.

This skill is for wording, capitalization, terminology, and consistency issues that can be fixed safely by script or reported for review.

## Scope

Use this skill for the initial scripted pass only on Git add-on topics in:

- `DITA-addons/add-ons/git-addon*.dita`

If the request goes beyond that scope, say so before acting.

## Dependencies

Before you act, consult the dependency index:

- `../dependencies/dependency-index.md`

Use it to find:

- the style guide
- related terminology files
- the fixer script
- the validator script
- the current rule inventory

## Workflow

Follow this workflow in order:

1. Classify each issue.
2. Assign safe scripted fixes to the language-style fixer script.
3. Run the fixer script.
4. Review the fixer report.
5. Run the validator script.
6. Review validation results and unresolved cases.
7. Summarize what changed, what was verified, and what still needs manual review.

Do not claim the script ran unless it actually ran.

## What belongs in this skill

Use this skill for issues such as:

- wording fixes
- terminology consistency
- capitalization consistency
- heading-case consistency according to project conventions
- file-name wording when the distinction between a generic file type and a literal file name matters
- index keyword review items that should be reported for manual follow-up

## Rule classes

### Safe scripted fixes

These can be assigned to the script:

- Replace `amount of characters` with `number of characters`.
- Prefer `context menu` over `contextual menu` where the phrase is generic prose and not a reusable UI term.
- Distinguish generic references to the global ignore file from literal code references such as `<codeph>ignore</codeph>`.

### Scripted fixes that require verification

These can be scripted, but must be checked after the run:

- heading-case normalization in known targeted headings
- figure-title wording updates
- terminology normalization across related Git conflict topics

### Report only

Do not auto-fix these unless the user explicitly expands the rules:

- index keyword updates that require editorial judgment
- wording changes in files that appear obsolete, unreferenced, or already manually revised
- cases where a wording change depends on verifying the actual UI label

## Project-specific rules

Apply these project rules:

- Follow company style conventions for project content even if personal preference differs.
- Where possible in the Git add-on docs, prefer `context menu` over `contextual menu`.
- The actual UI label is `Resolve conflict`.
- Distinguish between a generic reference to the global ignore file and a literal code or file-name reference such as `<codeph>ignore</codeph>`.

## Validation requirements

After every scripted run:

1. Run the validator script.
2. Check that targeted wording patterns were replaced correctly.
3. Check that no unintended wording changes were introduced.
4. Report any files that still need manual review.

## Output expectations

At the end, provide a short summary with:

- files changed
- rules applied
- validation status
- unresolved cases
