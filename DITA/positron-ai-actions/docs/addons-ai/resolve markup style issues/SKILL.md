---
name: Address markup style issues
description: Use this skill to assign safe markup-style fixes in the Git add-on documentation to a script, run the script, and verify the results.
---

# Address markup style issues

## Purpose

Use this skill to fix semantic markup and UI-markup issues according to project rules.

This skill is for markup problems such as invalid or weak semantic markup, inconsistent menu-path markup, and terminology references that should use reusable UI terms.

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
2. Assign safe scripted fixes to the markup-style fixer script.
3. Run the fixer script.
4. Review the fixer report.
5. Run the validator script.
6. Review validation results and unresolved cases.
7. Summarize what changed, what was verified, and what still needs manual review.

Do not claim the script ran unless it actually ran.

## What belongs in this skill

Use this skill for issues such as:

- menu separators written as plain text or as `<b>></b>` instead of semantic menu markup
- UI paths that should use `<menucascade>`
- places where a reusable UI term should be added and referenced with `conref` or `conkeyref`
- markup normalization that can be applied safely and repeatedly by script

## Rule classes

### Safe scripted fixes

These can be assigned to the script when the local structure is predictable:

- Replace menu separator patterns such as `<b>></b>` with semantic menu markup.
- Normalize menu-path markup to `<menucascade>` when the surrounding content clearly represents a UI path.
- Replace direct UI text for the conflict submenu label with a reusable terminology reference when the approved term exists.

### Scripted fixes that require verification

These can be scripted, but must be checked after the run:

- Menu-path rewrites in mixed-content paragraphs.
- Conversion of escaped separators such as `&gt;` into semantic menu markup.
- Replacing repeated UI labels with reusable references across multiple files.

### Report only

Do not auto-fix these unless the user explicitly expands the rules:

- cases where the intended UI structure is unclear
- cases where markup changes would also rewrite wording or topic structure
- files that appear unreferenced, obsolete, or already superseded by user edits

## Project-specific rules

Apply these project rules:

- Prefer `conref` or `conkeyref` for approved reusable UI terms when a terminology entry exists.
- The actual UI label is `Resolve conflict`.
- Add or use a Git Client terminology term with id `git-client-conflicts-resolve-conflict` on the Git staging terminology page.
- In this project, `fig` and `dl` elements must be wrapped in paragraphs.

## Validation requirements

After every scripted run:

1. Run the validator script.
2. Check that the targeted bad markup patterns are gone.
3. Check that the resulting XML remains valid.
4. Report any files that still need manual review.

## Output expectations

At the end, provide a short summary with:

- files changed
- rules applied
- validation status
- unresolved cases
