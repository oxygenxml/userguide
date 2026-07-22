# Rewrite the Git Client Add-on User Guide as a Best-Practice DITA Sample (`git-addon2`)

> **Status: completed.** This is the historical execution plan. It was authored in a `git-addon2/`
> folder; after completion the old doc was removed and `git-addon2/` was renamed to `git-addon/` to
> replace it. Read every `git-addon2` path below as the current `git-addon/`, and every reference to
> the "old `git-addon`" as the now-removed original.

## Context — why we're doing this

The existing Git Client add-on documentation (`DITA-addons/git-addon/`, ~62 files) grew organically. It works, but it has structural debt that makes it a poor model:

- **Wrong topic types.** ~40 procedures are authored as the generic `<topic>` type; only 2 real `<task>` topics exist. Concepts, references, and (notably) troubleshooting are inconsistently applied. There are **no** `<troubleshooting>` topics — known issues are buried in inline `<note>`s.
- **Repetition.** Interface Reference (5 topics) and Actions Reference (6 tables) re-describe what task topics already explain; the staging workflow is split across four topics describing one screen.
- **Inconsistent conventions.** Titles mix imperative and gerund forms; only ~18% of topics have a `<shortdesc>`; index terms use three different primary terms; UI-label reuse IDs use several ad-hoc prefix schemes.
- **Undocumented functionality.** Several Git features shipped via Jira (project `GIT`) are not yet in the docs.

We will **rewrite from scratch** into `DITA-addons/git-addon2/`, treating the old docs purely as a knowledge source. The goal is an exemplary DITA user guide: correct topic typing, a clean reuse architecture, a documented styleguide, a relaxed-but-precise voice, user-goal-oriented IA, and zero avoidable repetition. It should be the reference implementation other add-on docs are measured against.

**Decisions already confirmed with the user:**
- Scope: **full rewrite, all topics**, targeting **Git Client add-on 6.0** (the current unreleased version).
- Jira: **use the REST API** at `https://jira.sync.ro` via `JIRA_PERSONAL_TOKEN` (verified working; helper at `positron-ai-actions/jira-positron-integration/jira-fetch.js`). Project key `GIT`. The **Jira pass is done at planning stage** (findings below); execution only reconciles final wording.
- Images: **reuse the existing screenshots** (copy from `git-addon/img/` into `git-addon2/img/`, reorganized to our scheme).
- Build: **wire git-addon2 into `add-ons.ditamap`**.
- Reference layer: user wants us to **explore DITA reference constructs**, not default to flat tables — addressed in "Reference-topic strategy" below.
- Validation: **no separate authoring map** — validate/preview `git-addon2` through `DITA-addons/add-ons.ditamap`, which already supplies the upstream keys (`product`, `plugin-positron`, `reusables-addons/*`).
- Branch: create a **new branch off the latest `dev`** and do all work there.

---

## Guiding principles (encode these in the styleguide)

1. **Type by reader intent.** task = *how do I…*; concept = *what is / why*; reference = *look it up*; troubleshooting = *it broke*. Generic `<topic>` is banned.
2. **One source of truth per fact.** A UI label, an action definition, a warning, and the product name each live in exactly one place and are pulled in everywhere else.
3. **Tasks link, they don't re-describe.** A task references the relevant reference entry instead of restating control behavior. This is the core anti-repetition rule.
4. **Single-page output shapes linking.** The root uses `chunk="to-content"`, so the whole guide renders as **one HTML page** (the WebHelp side TOC points to in-page anchors). Therefore: **no** next/previous sequencing, **no** auto-generated child-link farms on hubs (children already follow inline), and **minimal** related-links. Cross-references are concise inline `<xref>`s that resolve to in-page anchors, used only where they genuinely help. Keep total link density low — the content reads top-to-bottom.
5. **Relaxed but precise.** Friendly `<shortdesc>`s, concept intros, and tips (contractions welcome); crisp, imperative, hedge-free steps.

---

## Deliverables & folder layout

```
DITA-addons/git-addon2/
  git_client_add_on.ditamap        # published submap (nav + keys + reltable + resource-only lib)
  git-addon.dita                   # root concept (landing/overview)
  git-addon-*.dita                 # all content topics (task/concept/reference/troubleshooting)
  lib/                             # reuse library (resource-only, high fan-in — "don't edit casually")
    git-staging-uicontrols.dita, git-history-uicontrols.dita,
    git-branch-uicontrols.dita, git-menu-uicontrols.dita,
    git-preferences-uicontrols.dita, git-reusables.dita   # shared notes/prereqs
  img/                             # reused screenshots, semantic subfolders
    icons/ dialogs/ dialogs/warnings/ staging/ staging/ignore/
    history/ branches/ menu/ preferences/ conflicts/
  style/                           # THIS project's meta-docs (markdown)
    STYLEGUIDE.md                  # the enforceable styleguide for git-addon2
    ARCHITECTURE.md                # DITA/reuse architecture + type-decision table + reuse contract
    IA.md                          # the information architecture (topic tree with types)
    PLAN.md                        # a copy of this execution plan, kept with the project
```

Rationale for the one deviation from the flat house convention (a `lib/` subfolder): the resource-only reuse topics have very high inbound fan-in (the staging UI-controls file is conref'd ~43×). Separating them physically encodes the "building blocks vs. pages" boundary that makes this a teachable sample.

---

## Styleguide (→ `style/STYLEGUIDE.md`)

Extends the house guide at `DITA/positron-ai-actions/docs/addons-ai/dependencies/oxygen-ug-styleguide.md` and `rules/styleguide/`; never contradicts them. Sections:

1. **Voice & tone** — second person, present, active. Relaxed contractions allowed **only** in `<shortdesc>`, concept intros, and notes/tips. Banned words: *powerful, easy, seamless(ly), effortless, robust, simply, just, intuitive*. Before/after examples in a Git context.
2. **Topic-type authoring patterns** — skeletal DITA for each of `<task>`, `<concept>`, `<reference>`, `<troubleshooting>`, plus the type-decision table.
3. **Titles & shortdesc** — task titles imperative ("Clone a Repository", never "Cloning a Repository"); concept/reference titles noun phrases; troubleshooting titles symptom statements ("Push Is Rejected Because the Branch Is Behind"). `<shortdesc>` mandatory on every topic; one sentence; no "This topic…".
4. **Notes, tips, warnings** — used sparingly; `warning`/`important` reserved for data-loss and shared-history risk (every "don't amend/rebase/reset pushed commits" caution); never stack same-type notes.
5. **UI & markup** — `<uicontrol>` for all UI names; `<menucascade>` for paths; icon `<image>` inside `<uicontrol>` before label, no space; `<ph keyref="product"/>` for Oxygen; add-on = "Git Client". Git-specific: Git-as-a-system verbs lowercase prose ("push your commits"), named buttons `<uicontrol>` with button-label case; `<codeph>` for `HEAD`, `main`, `origin`, `.gitignore`, `HTTPS`, `ssh-agent`, env vars (`HTTPS_PROXY`, `GNUPGHOME`), editor variables `${git(...)}`.
6. **Images** — PNG, white bg, ≤650×650, wrapped in `<fig>` with title (noun phrase); only when they aid orientation.
7. **Linking & reuse** — the three-way reuse contract (below); descriptive link text; external links `format="html" scope="external"`.
8. **Indexterms** — nested pattern, primary term standardized to exactly **`Git Client add-on`**; lowercase secondary phrases matching search language.
9. **Consistency decisions (the short list)** — "Git Staging view" (lowercase "view", never "panel/window/tab"); "contextual menu" not "context menu"; **select** for choosing UI (reserve **click** for physical actions, never "click on"); "repository" vs "working copy" vs "the remote" (never "repo"); "AI" for the generic capability, **AI Positron** (via the `plugin-positron` key) where the service is invoked; "3.5 hours" for the outdated-branch check.
10. **Pre-publish checklist.**

---

## DITA architecture & reuse strategy (→ `style/ARCHITECTURE.md`)

### The three-way reuse contract (teach this verbatim)

| Mechanism | Use for | Rule of thumb |
|---|---|---|
| **`keyref`** (`<ph>`/`<keyword>`/`<image>`/`<xref>`) | Atomic variable-like values: product name, add-on name, shared icon, external URL | "One word/thing that could change globally → key it." |
| **`conref`/`conkeyref`** | Whole reusable *blocks*: a shared note, `<li>`, warning, or a `<uicontrol>` element (may carry an inline icon) from the lib | "A chunk of authored markup reused verbatim → conref it." |
| **`xref`** | Sparing pointers to a reference entry or related topic (in-page anchors) | "Sending the reader elsewhere → link once, never duplicate; keep it rare." |

### Keys (local `<topicgroup id="keys">` in the submap)
- Keep/clean: `git-client-manual-download` (external URL), `plugin-git-client` (keyword "Git Client"), `sa-preferences`, `sa-toolbar`.
- Consumed from upstream (`add-ons.ditamap`/`DITA/maps/keydefs.ditamap`), **not** redefined: `product`, `plugin-positron`, `reusables-addons/*` (`p_install_button`, `ReadLicense-li`, `Restart-li`, `important_requires_positron`).
- New: key the standalone toolbar icons that appear in running prose so a single file swap propagates.

### Reuse library (`lib/`, resource-only)
- Keep the conref-based UI-terminology layer (conref is right because entries are marked-up `<uicontrol>`s carrying icons, which keyref on `<ph>` can't). **Regularize** the ID prefixes to one scheme: `gs-` (staging), `hist-` (history), `branch-` (branch manager), `menu-` (git menu), `pref-` (preferences), `conflict-` (conflict resolution).
- Add `git-reusables.dita` for git-local reusable blocks used by ≥2 topics (e.g., "a working copy is selected" prereq, "pull first if push rejected" pointer). Single-use notes stay inline.

### Map design
- One submap (no nested sub-submaps). Root `git-addon.dita` with `chunk="to-content"` (matches sibling add-ons) → **single-page output**.
- **No `collection-type="sequence"`** (no next/prev on a single page). Leave nesting to express the TOC; use `collection-type="unordered"`/`family` or none. Hubs do **not** emit generated child-link lists.
- **Minimal linking.** Prefer concise inline `<xref>`s (in-page anchor jumps) only where they add value — chiefly task → the relevant action-reference row. **Skip a full reltable-generated "Related information" farm**; if any related-links are used, keep them rare and targeted (a single-page doc repeats these blocks under every sub-section otherwise). The design showcase here is *disciplined, low link density*, not a reltable.
- Keys group + resource-only `<topichead>` ("Git Client Terminology & Reusables") after the nav tree.
- No standalone authoring map: validate/preview through `add-ons.ditamap`, which resolves the upstream keys.

### Naming & IDs
- Kebab-case, `git-addon-` prefix; **`@id == filename`** (lint-checkable). Verb-first filenames for tasks (`git-addon-clone-a-repository.dita`), noun for concepts/references. Troubleshooting: `git-addon-ts-<symptom>.dita`.
- Stable IDs for xref targets only: `section_<surface>_<meaning>`, action rows `action_<verb>_<object>`, lib controls `<prefix>-<meaning>`. Do **not** id every `<p>`.

---

## Reference-topic strategy — using DITA reference constructs properly

The user asked us to explore what `<reference>` offers beyond flat tables. We map each reference need to the best-fit construct instead of defaulting to one big table:

- **Preferences pages** (main, SSH Connections, AI) → **`<properties>`** element. `<prophead>` = Option / Default / Description; each `<property>` has `<proptype>` (option name in `<uicontrol>`), `<propvalue>` (default, e.g. "Always ask", "Selected"), `<propdesc>` (behavior + Global/Project note). This is the textbook semantic fit and reads far better than an ad-hoc table.
- **Editor variables** → **`<properties>`** (`<proptype>` = `${git(...)}` in `<codeph>`, `<propdesc>` = meaning).
- **View interface reference** (Git Staging, Git History, Git Branch Manager) → one `<reference>` each, using **`<section>`** per UI region (toolbar, header, file areas, commit area) with a stable `@id`, each section holding a compact **`<simpletable>`** of controls (Icon+Control / Description / Learn more). Merge the current 5 view topics to **4** by folding "Git menu" + "actions in other views" into one "Git Menu and Contextual Actions" reference.
- **Actions catalog** → keep the "define once, xref everywhere" pattern as **grouped `<reference>` topics by functional area** (~6, mirroring the workflow sections), each a **`<simpletable>`** whose `<strow>`/`<stentry>` carry stable `action_*` IDs for deep-linking, columns: Action (icon+name) / Description (one sentence) / Available From / Learn More (xref to the task). We keep a table here — not per-action `<section>`s — because a ~60-entry catalog of uniform entries is inherently scan-oriented; per-action sections would be verbose. Deep-linkability is preserved via row IDs.

Net: `<properties>` for options/variables, `<section>`+`<simpletable>` for views, grouped `<simpletable>` for the action catalog. This showcases the reference domain rather than one generic table shape. (Final choice between "6 grouped action tables" vs "consolidate to fewer" will be locked when authoring the gold-standard reference exemplar; default is grouped-by-area.)

---

## Information architecture (→ `style/IA.md`)

User-goal-oriented spine, then reference, then troubleshooting. Type key: **T**=task, **C**=concept, **R**=reference, **TS**=troubleshooting. Notable merges/splits vs. the old set are flagged.

- **Git Client Add-on** (C) — landing/overview.
- **1. Install the Git Client** (C) — compatibility + what you get.
  - Install from the Add-ons Store (drag and drop) (T) · Install manually from a file or update site (T)
- **2. Tour the Git Client Interface** (C) — the three views + where actions live.
- **3. Connect to a Git Server** (C) — credential model.
  - Authenticate over HTTPS (T) · Authenticate over SSH (T) · **Manage Credentials (T)** — *new for 6.0 (GIT-477): pre-populated login dialog, per-host credential management, reset.*
- **4. Set Up a Repository** (C)
  - Clone a Repository (T) · Create a Repository from Your Project (T, merges "create here") · Open an Existing Working Copy (T)
- **5. Review, Stage, and Commit Changes** (T) — *merges* unstaged/staged/committing into one flow.
  - Compare Changes Before Committing (T) · Sign Your Commits (T) · Write Commit Messages with AI (T) · Exclude Files from Version Control (T)
- **6. Synchronize with a Remote** (C)
  - Push Commits (T) · Pull Changes (T) · Fetch from Remotes (T) — *splits* the old single push-pull topic.
  - *about-pull-merge-vs-rebase* (C) — short concept both push/pull link from.
- **7. Resolve Conflicts** (C)
  - Resolve a File Conflict (T) · Resolve Conflicts with AI (T) · Track and Finish an In-Progress Operation (T, *merges* track + abort/restart/continue)
- **8. Work with Branches and Tags** (C)
  - Switch to Another Branch (T) · Check Out a Branch (T) · Create a Branch (T) · Merge, Rebase, or Cherry-Pick (T) · Revert or Reset Commits (T) · Create and Manage Tags (T)
- **9. Review History and Commits** (C)
  - Inspect and Compare Commits (T) · Explain a Commit with AI (T) · Show Blame (T)
- **10. Advanced Workflows** (C)
  - Stash Changes (T) · Work with Submodules (T) · Work with Worktrees (T) · Work with Large Files (Git LFS) (T)
- **11. Configure the Git Client** (C)
  - Git Client Preferences (R, `<properties>`) · SSH Connections Preferences (R) · AI Preferences (R) · Validate Before Commit and Push (T) · Git Editor Variables (R, `<properties>`)
- **12. Reference** (C)
  - Interface Reference: Git Staging View (R) · Git History View (R) · Git Branch Manager View (R) · Git Menu and Contextual Actions (R)
  - Git Actions Reference (R) — grouped-by-area action tables with `action_*` anchors.
- **13. Troubleshooting** (C) — new section:
  - Push Is Rejected Because the Branch Is Behind (TS) · Authentication Fails (GitHub/GitLab/Bitbucket) (TS) · Cannot Install from the Update Site (TS) · Git LFS Fails Behind a Proxy (TS) · Rebase or Merge Is Blocked (TS) · Repository Shows as Outdated (TS)
- **Resources** (R) — external links.

Net: 62 files → ~55 topics; duplicative interface/action files collapse; 6 troubleshooting topics promoted out of inline notes.

---

## Jira pass — 6.0 findings and TOC impact (done at planning stage)

The `GIT` project's **6.0** release (unreleased) carries 55 issues. 6.1 issues are open backlog and **out of scope** for this doc pass. TOC impact of 6.0:

**New topic added to the IA** (above):
- **Manage Credentials** (T) — GIT-477: login dialog now pre-populates stored credentials; per-host credential management supersedes the wipe-everything "Reset All Credentials"-only model.

**Enhancements folded into existing IA topics** (content to cover; no new sections):
- Partial stash — "Stash selected files…" context action + Include untracked (GIT-490) → *Stash Changes*.
- Improved blame — "Hide Blame" action, click-to-select revision (GIT-489) → *Show Blame* + actions reference.
- Push/Pull on the current local branch's context menu (GIT-462); Delete / Show in Branch Manager on branch labels (GIT-476) → *Branch Manager / History* references + actions.
- Pull submenu grouped in the Git Staging ellipsis menu (GIT-466, already draft-documented) → *Git Staging View* reference.
- History view: rich branch tooltips + "Go to tracked branch" (GIT-482), current-branch highlight (GIT-479), refs + committer date in commit description (GIT-481), working-copy label/filter improvements (GIT-488) → *Git History View* reference.
- Diff between multiple selected revisions (GIT-454) → *Inspect and Compare Commits*.
- Fetch improvements (GIT-463); AI prompt customization for commit-message/explain (GIT-464); AI conflict resolution (GIT-465); in-progress operation state in Staging + History (GIT-467); add files/folders to ignore (GIT-456); checkout-from-history pre-fill + tracking (GIT-459); image diff fix (GIT-461) → already reflected in the IA topics.
- Outdated-branch check opt-out preference + "Don't show again" (GIT-491) → new option in *Git Client Preferences* + the *Repository Shows as Outdated* troubleshooting topic.

**Execution reconcile step:** before finalizing each affected topic, `node positron-ai-actions/jira-positron-integration/jira-fetch.js <KEY>` to read the `notes.documentation`/`notes.qa`/comments (several issues say "see doc comment") and any attached screenshots, then match wording and exact UI labels. Do **not** post Jira comments unless the user asks.

---

## Execution sequence

0. **Branch**: `git fetch origin` then create a new branch off the latest `dev` (e.g. `git checkout -b git-addon2-docs origin/dev`). All work happens there. Do not commit/push unless asked.
1. **Scaffold** `git-addon2/` + `img/` (copy & reorganize screenshots from `git-addon/img/`) + `lib/` + `style/`. Write the four `style/*.md` meta-docs first (STYLEGUIDE, ARCHITECTURE, IA, PLAN) so authoring has rails.
2. **Reuse library**: port + regularize the terminology topics into `lib/` (IDs, titles, prefixes); create `git-reusables.dita`.
3. **Gold-standard exemplars** — author one polished topic per type (task = Clone a Repository; concept = Resolve Conflicts; reference = Git Client Preferences using `<properties>`; troubleshooting = Push Is Rejected…) to lock conventions before scaling.
4. **Author the spine** section by section per the IA, reclassifying/porting content from the old topics, extracting concepts and troubleshooting as we go. Reuse screenshots; tasks link into reference (never re-describe).
5. **Reference section** — build the view references (`<section>`+`<simpletable>`) and the grouped action tables with `action_*` anchors; preferences/variables as `<properties>`.
6. **Jira reconcile** — for each 6.0-affected topic, read the issue's `notes.documentation`/comments and align wording/labels (see the Jira findings above).
7. **Map finalize** — nav tree, keys group, resource-only lib group. No sequence/next-prev; no reltable link farm. Prune links to the minimum that helps a single-page reader.
8. **Wire in** — add `<topicref href="git-addon2/git_client_add_on.ditamap" format="ditamap"/>` under the `collaboration-addons.dita` group in `DITA-addons/add-ons.ditamap` (sibling to the existing git-addon line, ~line 21).
9. **Validate & QA** (below).

Standard skeletons to follow — task, concept, reference (`<properties>`), and troubleshooting (`<!DOCTYPE troubleshooting PUBLIC "-//OASIS//DTD DITA 1.3 Troubleshooting//EN" "troubleshooting.dtd">`, `<troublebody>` → `<condition>` + `<troubleSolution>`(`<cause>`+`<remedy>`)) — will be documented in `style/STYLEGUIDE.md`.

---

## Verification

- **DTD validity**: every topic validates against its declared DOCTYPE (task/concept/reference/troubleshooting). Confirm the troubleshooting DTD resolves (already used elsewhere in the repo).
- **Oxygen validation (preferred)**: **ask the user to run the DITA Map Validation and Check for Completeness on `add-ons.ditamap` (or the git-addon2 submap) in Oxygen and paste back the reported problems.** This is the authoritative check for keyref/conref/xref resolution, Schematron rules, and broken references; fix what it reports.
- **Key/link resolution**: resolve through `DITA-addons/add-ons.ditamap` (supplies `product`, `plugin-positron`, `reusables-addons/*`); no unresolved keyrefs/conrefs/xrefs. Run an ID-uniqueness / `@id==filename` check.
- **Schematron**: run the repo's `rules/*.sch` against `git-addon2/` and clear violations (the house rule engine the docs are validated by in Oxygen).
- **Publish (optional / user-run)**: publishing is best-effort — **the user runs the WebHelp build** (Add-Ons Userguide context: `DITA-addons/project-addons.xml` → `add-ons.ditamap`) and confirms git-addon2 renders as a single page with a correct TOC, resolved in-page anchors, and images, without stray next/prev or related-link clutter. I'll attempt the DITA-OT/Ant build only if it's straightforward in this environment; otherwise I'll hand it off to the user.
- **Editorial pass** against the `style/STYLEGUIDE.md` pre-publish checklist: every topic has a `<shortdesc>`, correct type, correct title form, standardized indexterms, no banned words, no duplicated action/control descriptions.
- **Coverage check**: diff the new IA against the old feature inventory + the Jira `GIT` findings to confirm nothing shipped is undocumented.
