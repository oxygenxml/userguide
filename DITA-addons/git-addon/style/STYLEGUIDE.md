# Git Client Add-on Documentation — Style Guide

**Applies to:** `DITA-addons/git-addon/`
**Extends:** the house guides at `DITA/positron-ai-actions/docs/addons-ai/dependencies/oxygen-ug-styleguide.md` and `rules/styleguide/`. Where the house rules already decide something (American spelling, list punctuation, hyphenation, title case mechanics), defer to them. This guide adds the Git-addon-specific rules and the type/reuse discipline that make this doc set a best-practice sample.

> **The one-line philosophy:** *Type by reader intent. One source of truth per fact. Tasks link, they don't re-describe. Relaxed but precise.*

---

## 1. Voice and Tone

Write for a technical user who reads to *do*, not to browse. Be the friendly expert sitting next to them.

- **Second person, present tense, active voice.** "You commit your changes," never "changes are committed" or "the user can commit."
- **Relaxed is allowed in exactly three places:** the `<shortdesc>`, concept intros, and notes/tips. Contractions (`you'll`, `don't`, `it's`) are welcome there.
- **Procedures stay crisp.** Steps are imperative, one action each, no contractions, no hedging.
- **No marketing language.** Banned words: *powerful, easy, easily, simple, simply, just, seamless(ly), effortless, robust, intuitive, powerful, quickly*. State what the feature does, not how great it is.
- **Talk about the user's goal, not the software's feelings.** The Git Client doesn't "empower" or "allow" you — you do things with it.

**Before → after (Git context):**

| Reject | Prefer |
|---|---|
| "The Git Client makes it easy to seamlessly push your changes." | "Push sends your local commits to the remote repository." |
| "Changes can be staged by the user by clicking the stage button." | "To stage a change, select **Stage Selected**." |
| "It is possible that a conflict may potentially occur during a merge." | "A merge can produce conflicts when the same lines change on both branches." |
| shortdesc: "This topic describes the procedure for cloning." | shortdesc: "Copy a remote repository to your machine so you can start working with it." |
| tip: "Users are advised that stashing is available." | tip: "In a hurry? Stash your changes to switch branches without committing." |

---

## 2. Topic Types — Choose by Reader Intent

Generic `<topic>` is **banned**. Every topic is one of four types:

| If the topic primarily… | Use | Root / body |
|---|---|---|
| tells the reader how to perform an ordered procedure | `<task>` | `<taskbody>`: `<prereq>` `<context>` `<steps>` `<result>` |
| explains what something is, why it exists, how it fits | `<concept>` | `<conbody>` |
| is a lookup surface (options, controls, variables, actions) | `<reference>` | `<refbody>`: `<properties>` / `<section>`+`<simpletable>` |
| diagnoses a symptom → cause → fix | `<troubleshooting>` | `<troublebody>`: `<condition>` `<troubleSolution>`(`<cause>`+`<remedy>`) |

**Tie-breaker:** a topic with both ordered steps *and* substantial background gets split — background to a `<concept>`, steps to a `<task>` whose `<context>` links to the concept in one line. Never author a "concept-flavored task."

### 2.1 Task skeleton

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE task PUBLIC "-//OASIS//DTD DITA Task//EN" "task.dtd">
<task id="git-addon-clone-a-repository">
  <title>Clone a Repository</title>
  <shortdesc>Copy a remote repository to your machine so you can start working with it.</shortdesc>
  <prolog><metadata><keywords>
    <indexterm>Git Client add-on<indexterm>cloning repositories</indexterm></indexterm>
  </keywords></metadata></prolog>
  <taskbody>
    <context>
      <p>You clone from the <uicontrol conkeyref="gs-uicontrols/gs-view"/> view.</p>
    </context>
    <steps>
      <step><cmd>On the <uicontrol>Git Staging</uicontrol> toolbar, open the
        <uicontrol><image href="img/icons/Ellipsis18.png"/>Vertical Ellipsis</uicontrol> menu and
        select <uicontrol><image href="img/icons/Add16.png"/>Clone Repository</uicontrol>.</cmd></step>
      <step><cmd>Fill in the clone dialog box.</cmd>
        <info>
          <p><!-- dl and fig must be wrapped in a p (house Schematron rule) -->
            <dl>
              <dlentry><dt><uicontrol>Repository URL</uicontrol></dt><dd>The remote repository URL.</dd></dlentry>
              <dlentry><dt><uicontrol>Checkout Branch</uicontrol></dt><dd>The branch to check out. Leave empty for the default branch.</dd></dlentry>
              <dlentry><dt><uicontrol>Destination Path</uicontrol></dt><dd>The local folder for the clone.</dd></dlentry>
            </dl>
          </p>
        </info>
      </step>
    </steps>
    <result><p>The Git Client sets the clone as the current working copy.</p></result>
  </taskbody>
</task>
```

**Task rules:**
- `<prereq>` — required state only ("A working copy is selected"; the "requires AI Positron" note via `conkeyref="reusables-addons/important_requires_positron"`). No steps here.
- `<context>` — 1–3 relaxed sentences of why/when + at most one link to a concept. Keep conceptual bulk out.
- `<steps>` — one action per `<step>`; `<cmd>` is a single imperative sentence. Supporting detail in `<info>`; **dialog fields go in a `<dl>` inside `<info>`, never renumbered as steps**. Per-step outcome in `<stepresult>` only when non-obvious.
- `<result>` — the end state.
- Use `<choicetable>`/`<choices>` for "pick one of N" within a step (e.g. Pull merge vs rebase).

### 2.2 Concept skeleton

```xml
<!DOCTYPE concept PUBLIC "-//OASIS//DTD DITA Concept//EN" "concept.dtd">
<concept id="git-addon-resolve-conflicts">
  <title>Resolve Conflicts</title>
  <shortdesc>When the same lines change on two branches, Git needs your help deciding what to keep.</shortdesc>
  <conbody>
    <p>A conflict happens when…</p>
  </conbody>
</concept>
```

Concept titles are noun phrases. No numbered steps. A concept may hold a table (e.g. the interface-overview "areas by location" table).

### 2.3 Reference — use the right construct (not always a table)

- **Options / preferences → `<properties>`.** Semantic fit; renders cleanly. Use `<properties>` **only when you populate all three columns** (`<proptype>` / `<propvalue>` / `<propdesc>`) — it always renders three columns, so a two-column lookup (no value) leaves an ugly empty middle column. For a pure two-column lookup such as editor variables (name → meaning), use a **`<simpletable>`** with two `<stentry>` columns instead.

```xml
<!DOCTYPE reference PUBLIC "-//OASIS//DTD DITA Reference//EN" "reference.dtd">
<reference id="git-addon-preferences">
  <title>Git Client Preferences</title>
  <shortdesc>The options on the main Git Client preferences page.</shortdesc>
  <refbody>
    <!-- properties is a direct child of refbody; it is NOT wrapped in a section -->
    <properties>
      <prophead><proptypehd>Option</proptypehd><propvaluehd>Default</propvaluehd><propdeschd>Description</propdeschd></prophead>
      <property>
        <proptype><uicontrol>Notify me about new commits in the remote repository</uicontrol></proptype>
        <propvalue>Cleared</propvalue>
        <propdesc>Shows a notification when the remote has new commits.</propdesc>
      </property>
    </properties>
  </refbody>
</reference>
```

- **View interface → `<section>` per UI region + a compact `<simpletable>` of controls.**
- **Action catalog → grouped `<reference>` topics, one `<simpletable>` each**, with stable `action_*` IDs on `<strow>` for in-page deep-links. Columns: Action (icon+name) / Description (one sentence) / Available From / Learn More (xref to the task). Reference **Description** cells are one crisp sentence — never a procedure; the "how" lives in the task.

### 2.4 Troubleshooting skeleton

```xml
<!DOCTYPE troubleshooting PUBLIC "-//OASIS//DTD DITA 1.3 Troubleshooting//EN" "troubleshooting.dtd">
<troubleshooting id="git-addon-ts-push-rejected-behind">
  <title>Push Is Rejected Because the Branch Is Behind</title>
  <shortdesc>If the remote has commits you don't have yet, the Git Client blocks the push until you catch up.</shortdesc>
  <troublebody>
    <condition><p>Pushing fails with a message that the current branch is behind its remote.</p></condition>
    <troubleSolution>
      <cause><p>Someone pushed commits to the remote after your last pull.</p></cause>
      <remedy><steps>
        <step><cmd>Pull the remote changes.</cmd></step>
        <step><cmd>Resolve any conflicts, then push again.</cmd></step>
      </steps></remedy>
    </troubleSolution>
  </troublebody>
</troubleshooting>
```

The `<shortdesc>` is phrased as the symptom — that is what search and any related link surface.

---

## 3. Titles and Short Descriptions

- **Task titles** — imperative verb phrase, title case: "Clone a Repository", "Push Commits", "Resolve a File Conflict". **Never gerund** ("Cloning a Repository").
- **Concept / reference titles** — noun phrases: "Git Staging View", "Git Actions Reference", "Advanced Workflows".
- **Troubleshooting titles** — a symptom statement: "Push Is Rejected Because the Branch Is Behind".
- **`<shortdesc>` is mandatory on every topic.** One sentence, states the benefit or purpose, reads as a standalone search snippet. Do not start with "This topic…" or "Describes how to…". Aim 10–25 words.
- **Keep shortdescs short — cut filler.** Because the guide publishes as one page (`chunk="to-content"`), every shortdesc is rendered together, so length adds up. Drop words that carry no meaning: "The controls **that are available** in…" → "The controls in…"; "The options **available in** the… page" → "The options on the… page"; "**Allow** X **to** analyze… a resolution **that** you can review" → "**Let** X analyze… a resolution you can review". Prefer the shorter wording whenever the extra words don't change the meaning.
- **"How to …" is allowed for task shortdescs.** A task shortdesc may open with "How to \<verb\>…" (for example, "How to check out an existing branch…"). This is the one sanctioned exception to the "no 'Describes how to…'" rule above — keep it tight and don't pad it.

---

## 4. Notes, Tips, and Warnings

Use sparingly — prefer working the point into the prose.

- `type="tip"` — an optional shortcut or nice-to-know. Relaxed tone.
- `type="note"` — a neutral clarification that would break the flow inline.
- `type="important"` / `type="warning"` — **reserved for data loss or shared-history risk.** Every "don't amend / rebase / reset commits you've already pushed" caution is a `warning`.
- Never stack two notes of the same type. A warning states the consequence, not just the prohibition.

---

## 5. UI and Markup

House rules (keep): `<uicontrol>` for every UI name; `<menucascade>` for menu paths; icon `<image>` **inside** the `<uicontrol>`, immediately before the label, no space; `<ph keyref="product"/>` for the Oxygen product name.

Git-specific:

- **Product vs add-on.** Oxygen = `<ph keyref="product"/>`. The add-on = "the Git Client" (or "Git Client add-on" on first mention). Use the `plugin-git-client` key for the name.
- **Git as a system vs named UI action.** Lowercase prose for the concept/verb ("push your commits", "rebase onto `main`"); `<uicontrol>` with the button's own capitalization for the named action (`<uicontrol>Push</uicontrol>`, `<uicontrol>Stage Selected</uicontrol>`).
- **`<codeph>`** for refs, branch names, commands, and env vars: `HEAD`, `main`, `origin`, `HTTPS`, `ssh-agent`, `HTTPS_PROXY`, `GNUPGHOME`. Use `<filepath>` when it is specifically a file or path (`.gitignore`, `~/.gnupg`, `.xpr`).
- **Editor variables** in `<codeph>`: `${git(working_copy_name)}`.
- **Reuse UI-label strings from `lib/`** via `conkeyref` addressed by the lib handle key (e.g. `conkeyref="gs-uicontrols/gs-view"`, not a `lib/…​.dita#…` path) — name a control once, reference it everywhere (see ARCHITECTURE.md).

---

## 5a. House Schematron Rules (enforced by `rules/rules.sch`)

These are validated automatically in Oxygen. Follow them as you author:

- **Wrap `<fig>` and `<dl>` in a `<p>`.** Never place them as bare children of `<section>`, `<info>`, `<conbody>`, or `<condition>` — always `<p><fig>…</fig></p>` and `<p><dl>…</dl></p>`.
- **Every `<section>` needs an `@id` and a `<title>`.** This includes the "intro" section of a reference topic (title it `Overview`). Note `<refbody>` does not allow bare `<p>`/`<fig>` — intro prose and screenshots must live inside a titled `<section>`.
- **Troubleshooting `<condition>`, `<cause>`, and `<remedy>` are specialized sections** — give each an `@id` and a `<title>` (`Problem`, `Cause`, `Solution`).
- **Give every `<codeblock>` an `@outputclass`** naming its language (for example, `language-dos`, `language-xml`) so it isn't misread as XML.
- **Never hard-code the product name.** Use `<ph keyref="product"/>` in prose — even inside a `<propdesc>`. (A literal UI label that contains "Oxygen" stays as-is inside `<uicontrol>`.)

## 6. Images

- PNG, white background, ≤ 650 × 650 px. Wrap in `<fig>` with a title (noun phrase, title case): "Clone Repository Dialog Box".
- Screenshot only when it aids orientation — the Git Staging view, History graph, Branch Manager tree, and multi-field dialogs qualify; a single URL field does not.
- Store under `img/<area>/` (`staging/ history/ branches/ dialogs/ menu/ preferences/ conflicts/ icons/`). Reuse `img/icons/*.png` for inline action icons rather than re-cropping.
- Add `@id` to an `<image>` only if it is referenced.

---

## 7. Linking and Reuse

- **Single-page output.** The guide publishes as one page (`chunk="to-content"`), so links are in-page anchor jumps. **No next/previous, no generated child-link lists, no related-link farm.** Keep link density low; the content reads top to bottom.
- **Tasks link, they don't re-describe.** A task references the relevant action-reference row for the authoritative "what it does / where it lives"; the task shows only the procedure. This is the core anti-repetition rule.
- **Descriptive link text** — "see [Pull Changes]", never "click here".
- **External links** — `format="html" scope="external"` (GitHub/GitLab/Bitbucket docs, Git LFS, etc.).
- **One canonical home per fact** — server-auth caveats live in Troubleshooting and are referenced, not copied.
- Use the three-way reuse contract (keyref / conkeyref / xref) from ARCHITECTURE.md.

---

## 8. Index Terms

- Nested pattern; primary term standardized to exactly **`Git Client add-on`**:

```xml
<indexterm>Git Client add-on<indexterm>cloning repositories</indexterm></indexterm>
```

- Every topic carries at least one `Git Client add-on<…>` pair in `<prolog><metadata><keywords>`.
- Secondary terms are lowercase noun/gerund phrases matching user search language: "cloning repositories", "resolving conflicts", "commit signing", "personal access tokens", "Git LFS".

---

## 9. Consistency Decisions (the short list)

- **View names:** "Git Staging view", "Git History view", "Git Branch Manager view" — lowercase "view", following the name. Never "panel", "window", or "tab".
- **Menus:** "contextual menu" for the right-click menu (this is the established Oxygen User Guide norm — the main guide uses "contextual menu" ~900 times vs "context menu" a handful; do not use "context menu").
- **select vs click:** use **select** for choosing an action, menu item, button, checkbox, or list entry. Reserve **click** for when the physical mouse action matters (a graph node); use **double-click** explicitly. Never "click on".
- **Repository / working copy / remote:** "repository" = the Git repository; "working copy" = the local checkout the Git Client currently operates on; "the remote" = the remote repository. Never "repo".
- **Operations vs actions:** lowercase prose for the verb ("push your commits"); `<uicontrol>` with button case for the named action. Decide each action's capitalization once (match the button text) and reuse it from `lib/`.
- **AI Positron name:** the AI product is **AI Positron** — always reference it with the key `<ph keyref="plugin-positron"/>` (defined in `add-ons.ditamap`, expands to "AI Positron"), never hardcode the name or use bare "Positron". Use plain "AI" only for the generic capability. The "requires AI Positron" prerequisite note is `conkeyref="reusables-addons/important_requires_positron"`.
- **Dialog boxes:** write "dialog box", never bare "dialog" (for example, "the Checkout dialog box").
- **Manually:** use "manually", not "by hand".
- **No em-dashes:** avoid em-dash (`—`) asides in topic prose; reflow them into separate sentences or parentheses. In choice/label lists use "`<uicontrol>Label</uicontrol>` - description" with a spaced hyphen, and use "-" (not "—") for an empty or placeholder cell value.
- **No clause-joining semicolons:** do not join two clauses with a semicolon. Write two sentences, or use a conjunction such as "and", "so", or "then". A semicolon is acceptable only to separate items in a list whose entries already contain commas.
- **Numbers:** the outdated-branch check runs "every 3.5 hours".
- **Version:** this doc set targets Git Client add-on **6.0**.

---

## 10. Pre-Publish Checklist

- [ ] Correct DITA type for the job (task / concept / reference / troubleshooting)?
- [ ] Title follows the type's rule (imperative / noun phrase / symptom)?
- [ ] `<shortdesc>` present, one sentence, no "This topic…", standalone-readable?
- [ ] Steps single-action, imperative, no banned words, no "simply/just"?
- [ ] Every UI name in `<uicontrol>`; menu paths in `<menucascade>`; icons in-`<uicontrol>` with no space?
- [ ] Product = `<ph keyref="product"/>`; add-on = "Git Client"?
- [ ] Warnings only for data-loss / shared-history risk; notes not stacked?
- [ ] No duplicated control/action descriptions — links into Reference instead?
- [ ] At least one `Git Client add-on<…>` indexterm?
- [ ] Images in `<fig>` with title, PNG, white bg, ≤ 650 px; only where they help?
- [ ] Links resolve; descriptive text; external links `format="html" scope="external"`; link density low?
- [ ] `@id` == filename; stable IDs only on real xref/conref/conkeyref targets?
- [ ] American spelling; house list-punctuation rules followed?
