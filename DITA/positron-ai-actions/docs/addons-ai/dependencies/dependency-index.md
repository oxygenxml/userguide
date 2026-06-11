# Dependency index

## Purpose

This file lists the dependencies and working references for the add-ons AI skills that resolve markup style issues and language style issues.

## Skills

- `../resolve markup style issues/SKILL.md`
- `../resolve lang style issues/SKILL.md`

## Style guide

- `oxygen-ug-styleguide.md`

Use the style guide for:

- voice and tone
- heading capitalization rules used by the project
- UI markup rules such as `<uicontrol>` and `<menucascade>`
- code and file-name markup rules

## Project-specific terminology and content references

Use these project files when a fix depends on approved UI labels or reusable terms:

- `DITA-addons/add-ons/git-staging-uicontrols.dita`
- `DITA-addons/add-ons/git-history-view.dita`
- `DITA-addons/add-ons/plugin-preferences.dita`

Important current rule:

- The actual UI label is `Resolve conflict`.
- Add or use a reusable terminology entry with id `git-client-conflicts-resolve-conflict` on the Git staging terminology page.

## Scope definition

Initial scripted scope:

- `DITA-addons/add-ons/git-addon*.dita`

If a requested fix falls outside this scope, report it before acting.

## Script dependencies

Planned fixer script:

- `positron-ai-actions/scripts/fix_git_addon_style_issues.py`

Planned validator script:

- `positron-ai-actions/scripts/validate_git_addon_style_issues.py`

These scripts should:

- apply safe scripted fixes
- emit a report of changed files and applied rules
- validate that targeted patterns were fixed
- report unresolved or ambiguous cases

## Current rule inventory

### Markup-style rules

Safe or likely scripted:

- replace menu separator patterns such as `<b>></b>` with semantic menu markup when safe
- normalize menu paths to `<menucascade>` when the structure is clear
- replace direct UI labels with reusable terminology references when an approved term exists

Needs verification:

- mixed-content menu-path rewrites
- escaped separator rewrites such as `&gt;`
- repeated terminology replacement across multiple files

### Language-style rules

Safe or likely scripted:

- `amount of characters` → `number of characters`
- prefer `context menu` over `contextual menu`
- distinguish generic references to the global ignore file from literal code references such as `<codeph>ignore</codeph>`

Needs verification:

- heading-case normalization in targeted headings
- figure-title wording updates
- terminology normalization across related conflict topics

Report only for now:

- index keyword updates that require editorial judgment
- wording changes that depend on unresolved UI verification
- files that appear obsolete, unreferenced, or already manually revised

## Validation procedure

After each scripted run:

1. Run the validator script.
2. Confirm that targeted bad patterns are gone.
3. Confirm that expected replacements are present.
4. Confirm that XML remains valid.
5. Review unresolved cases manually.

## Notes

Global ignore terminology must distinguish between:

- a generic reference to the global ignore file
- a literal code or file-name reference such as `<codeph>ignore</codeph>`

If this rule is not already present in the style guide, add it there.
