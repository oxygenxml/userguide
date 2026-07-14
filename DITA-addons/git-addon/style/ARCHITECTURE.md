# Git Client Add-on Documentation — DITA Architecture & Reuse Strategy

**Applies to:** `DITA-addons/git-addon/`

This document explains *how the doc set is built* — topic types, reuse mechanisms, keys, file layout, and the map. It is the companion to `STYLEGUIDE.md` (which covers *how to write*).

---

## 1. Guiding principles

1. **Type by reader intent.** task / concept / reference / troubleshooting. Generic `<topic>` is banned. (See the decision table in STYLEGUIDE.md §2.)
2. **One source of truth per fact.** A UI label, an action definition, a warning, and the product name each live in exactly one place and are pulled in everywhere else.
3. **Tasks link, they don't re-describe.**
4. **Single-page output shapes linking.** The root topicref uses `chunk="to-content"`, so the whole guide renders as one HTML page. No next/previous, no generated child-link lists, no reltable link farm. Links are sparing, in-page anchor jumps.

---

## 2. The three-way reuse contract

| Mechanism | Use it for | Rule of thumb |
|---|---|---|
| **`keyref`** (on `<ph>`, `<keyword>`, `<image>`, `<xref>`) | atomic, variable-like values: product name, add-on name, a shared icon, an external URL | "One word/thing that could change globally → key it." |
| **`conkeyref`** (preferred) / `conref` | whole reusable *blocks*: a shared note, `<li>`, warning, or a `<uicontrol>` element (which may carry an inline icon) from `lib/` | "A chunk of authored markup reused verbatim → conkeyref it via the lib handle key." |
| **`xref`** | sparing pointers to a reference entry or a related topic (in-page anchors) | "Sending the reader elsewhere → link once, never duplicate; keep it rare." |

**Why conref (not keyref) for UI labels:** a control label is often a marked-up `<uicontrol>` carrying an inline `<image>` icon. `keyref` on a `<ph>` can't cleanly carry that icon child; a content reference copies the whole element. So: **content reference for labels with structure and an owning UI surface; keyref for global brand variables.**

**Address `lib/` blocks by key, not path.** Every `lib/` topic has a handle key in the map (e.g. `gs-uicontrols` → `git-staging-uicontrols.dita`; see §3–§4), so write `conkeyref="gs-uicontrols/gs-view"` rather than a hardcoded `conref="lib/…​.dita#…"` path. The key indirection means moving or renaming a lib file touches only its one keydef, not the hundreds of references — and the reference reads shorter and drops the repeated topic id.

---

## 3. Keys

Defined locally in the submap's `<topicgroup id="keys">`:

| Key | Target | Purpose |
|---|---|---|
| `git-client-manual-download` | external URL (`format="html" scope="external"`) | add-on download link |
| `plugin-git-client` | keyword "Git Client" | add-on name brand token |
| `gs-uicontrols`, `hist-uicontrols`, `branch-uicontrols`, `menu-uicontrols`, `pref-uicontrols` | the matching `lib/*-uicontrols.dita` topic | conkeyref handle for that surface's UI labels |
| `reuse-lib` | `lib/git-reusables.dita` | conkeyref handle for shared blocks |

Consumed from **upstream** (`add-ons.ditamap` / `DITA/maps/keydefs.ditamap`) — **never redefined here**:

- `product` — the Oxygen product name (`<ph keyref="product"/>`).
- `plugin-positron` — the AI Positron add-on name.
- `reusables-addons/*` — cross-add-on reusable blocks (`p_install_button`, `ReadLicense-li`, `Restart-li`, `important_requires_positron`).

Because these resolve at publication time from the root map, **validate and preview through `DITA-addons/add-ons.ditamap`** — there is no separate authoring map.

---

## 4. The `lib/` reuse library (resource-only, high fan-in)

`lib/` holds the building blocks that are reused (via `conkeyref`) across many topics. They are physically separated from authored pages to signal "high fan-in — edit with care." Each is a plain `<topic>` referenced `processing-role="resource-only"` from the submap, and each has a **handle key** (§3) so topics address it by key, not path — e.g. `conkeyref="gs-uicontrols/gs-view"`.

| File | Handle key | Holds |
|---|---|---|
| `git-staging-uicontrols.dita` | `gs-uicontrols` | all Git Staging view control labels (toolbar, areas, stage controls, commit area, ignore submenu, conflict actions) |
| `git-history-uicontrols.dita` | `hist-uicontrols` | Git History view + explain-commit labels |
| `git-branch-uicontrols.dita` | `branch-uicontrols` | Git Branch Manager labels |
| `git-menu-uicontrols.dita` | `menu-uicontrols` | Git menu + contextual-action labels |
| `git-preferences-uicontrols.dita` | `pref-uicontrols` | preferences-page navigation + option labels |
| `git-reusables.dita` | `reuse-lib` | git-local reusable *blocks* (shared prereqs/notes used by ≥ 2 topics) |

**ID prefix scheme** (regularized — one scheme, self-documenting):

| Prefix | Surface |
|---|---|
| `gs-` | Git Staging |
| `hist-` | Git History |
| `branch-` | Git Branch Manager |
| `menu-` | Git menu |
| `pref-` | Preferences |
| `conflict-` | conflict resolution |
| `reuse-` | shared blocks in `git-reusables.dita` |

**When to add to `lib/`:** a UI label used anywhere, or a block reused by ≥ 2 topics. A note used exactly once stays inline in its topic — don't over-abstract.

---

## 5. Actions catalog — "define once, xref everywhere"

Every Git action is defined **once** in a grouped `<reference>` topic (by functional area), as a `<simpletable>` row with a stable `action_<verb>_<object>` ID. Tasks and interface topics `xref` into that row for the authoritative description and "Available From" locations; they never restate it. This is the single strongest reuse pattern — preserve it.

Grouping (mirrors the workflow spine):

- `git-addon-actions-repository.dita` — clone, open/select working copy, create repository, show working copy in Finder/Terminal
- `git-addon-actions-stage-commit.dita` — open, compare, stage/unstage, discard, commit, AI message, amend, auto-push
- `git-addon-actions-sync-conflicts.dita` — push, pull (merge/rebase/other), fetch, resolve using mine/theirs, mark resolved, resolve with AI, abort/restart/continue
- `git-addon-actions-branches-history.dita` — checkout, create/merge/squash-merge/rebase/cherry-pick/revert/reset branch, track, delete, tags, history compares, explain, blame
- `git-addon-actions-advanced.dita` — stash (incl. partial), submodule
- `git-addon-actions-configuration.dita` — manage remotes, edit config, preferences, credential management

---

## 6. File & folder layout

```
git-addon/
  git_client_add_on.ditamap        # published submap
  git-addon.dita                   # root concept
  git-addon-*.dita                 # content topics (task/concept/reference/troubleshooting)
  lib/                             # resource-only reuse library (§4)
  img/                             # reused screenshots, semantic subfolders
  style/                           # meta-docs (this file, STYLEGUIDE, IA, PLAN)
```

**Naming & IDs:**

- Kebab-case, `git-addon-` prefix. **`@id` == filename** (lint-checkable; makes `href="file.dita#file"` mechanical).
- Verb-first filenames for tasks (`git-addon-clone-a-repository.dita`); noun for concepts/references (`git-addon-git-staging-view.dita`); `git-addon-ts-<symptom>.dita` for troubleshooting.
- Stable IDs only on real xref/conref targets: `section_<surface>_<meaning>`, `action_<verb>_<object>`, `lib` controls `<prefix>-<meaning>`. **Do not `@id` every `<p>`.**

---

## 7. Map design

- **One submap** (`git_client_add_on.ditamap`), no nested sub-submaps. The outer nesting comes from `add-ons.ditamap`.
- Root `git-addon.dita` carries `chunk="to-content"` → single-page output (matches sibling add-ons).
- **No `collection-type="sequence"`** (no next/prev on one page). Nesting expresses the WebHelp TOC. Use `collection-type="family"`/`unordered` or nothing.
- **Minimal linking.** No reltable link farm; concise inline `<xref>`s only where they help (chiefly task → action-reference row).
- After the navigation tree: the `<topicgroup id="keys">` (§3) and a `processing-role="resource-only"` `<topichead>` ("Git Client Terminology & Reusables") pointing into `lib/` (§4).
- Wired into the publication with one line under the `collaboration-addons.dita` group in `add-ons.ditamap`:
  ```xml
  <topicref href="git-addon/git_client_add_on.ditamap" format="ditamap"/>
  ```

---

## 8. What makes this an exemplary reference implementation

1. All four topic types present and correctly used, including a real Troubleshooting section extracted from what were buried inline notes.
2. A one-page reuse contract (§2) + type-decision table (STYLEGUIDE §2) with a gold-standard example of each type.
3. Physical separation of the reuse library (`lib/`) from authored pages.
4. "Define once, xref everywhere" action catalog with stable IDs.
5. Reference domain used properly — `<properties>` for preference options (three populated columns), `<simpletable>` for two-column lookups such as editor variables and the action catalog, `<section>`+`<simpletable>` for views — not one generic table shape.
6. Disciplined, low link density tuned to single-page output.
7. Stable, documented, lint-checkable ID schemes (`@id`==filename, `action_*`, `section_*`, `lib` prefixes).
