# Translation QA report — fr-FR

Scope: 137 DITA resources (2 maps, 135 topics) of the `fr-FR` index entries in `.contentfusion/i18n/translation-index.xml` (product: Content Fusion, Cloud; targets under `DITA-cf/i18n/fusion-cloud/fr-FR/`). The index also holds 218 binary asset entries (images) that are byte-identical copies; they carry no translatable text and are not reviewed.

## 1. Summary

Files reviewed: **137 / 137**. Total issues: **83**.

**Grouped by category**

| Category | Count |
|---|---|
| Terminology | 24 |
| Language Quality | 5 |
| Accuracy and Completeness | 9 |
| Consistency | 10 |
| Style and Naturalness | 6 |
| UI Terminology | 29 |

**Grouped by severity**

| Severity | Count |
|---|---|
| Critical | 0 |
| Major | 2 |
| Minor | 66 |
| Suggestion | 15 |

## 2. Root-cause rollup

| Root cause | Issues | Fixed in | Details |
|---|---|---|---|
| `ui-label-left-in-english` | 25 | the translation | A UI label that has a row in the UI strings file (matching up to a trailing ellipsis or a small wording difference) was left in English; fixed in the translation. |
| `deprecated-term-used` | 10 | the translation | A rendering marked `deprecated` or `forbidden` in the terminology file was used instead of the approved one; fixed in the translation. |
| `ui-strings-conflicts-with-terminology` | 9 | the UI strings file | The UI strings file itself contradicts the terminology file, so the translation that applies the UI string correctly violates the approved terminology; fixed in the UI strings file. |
| `label-language-depends-on-markup` | 9 | the translation or the UI strings file | The same concept or label is rendered in different ways in different places of the set; fixed in the translation (and the UI strings file where a row is missing). |
| `source-defect-propagated` | 4 | the source | The English source contains an error that was translated faithfully; fixed in the source. |
| `mixed-language-menu-path` | 4 | the translation or the UI strings file | Menu paths of the Oxygen desktop application mix CF ui-strings translations with English labels that have no ui-strings row. |
| `imprecise-rendering-of-meaning` | 4 | the translation | The French wording is plausible but blurs or slightly shifts the source meaning; fixed in the translation. |
| `source-language-calque` | 3 | the translation | English sentence structure or idiom was carried over literally into French; fixed in the translation. |
| `unnatural-wording` | 2 | the translation | The wording is understandable but reads as a translation rather than native technical French; fixed in the translation. |
| `ui-strings-source-error` | 2 | the UI strings file | The UI strings file itself contains a spelling or wording error that the translation copies; fixed in the UI strings file. |
| `status-state-mixed` | 2 | the translation | `status` was rendered `état` where the terminology file prescribes `statut`; fixed in the translation. |
| `glossary-term-missed` | 2 | the translation | An approved rendering from the terminology file was not applied; fixed in the translation. |
| `forbidden-term-used` | 2 | the translation | A rendering marked `forbidden` in the terminology file appears in the target; fixed in the translation. |
| `ungrammatical-sentence` | 1 | the translation | A sentence is ungrammatical or garbled in French (missing object, wrong agreement or broken construction); fixed in the translation. |
| `source-word-order-kept` | 1 | the translation | English word order or capitalization was kept in a French phrase around a UI label; fixed in the translation. |
| `non-translatable-markup-translated` | 1 | the translation | Internal markup that is not reader-facing content was translated; fixed in the translation or in the validation rules. |
| `label-inflected-in-sentence` | 1 | the translation | A UI label was inserted into a sentence without the supporting noun or agreement the instructions require; fixed in the translation. |
| `elision-broken-by-line-break` | 1 | the translation | A typographic rule of the target language (elision, spacing or punctuation) was not applied or was broken by line wrapping; fixed in the translation. |

## 3. Issue records

## Terminology

### `deprecated-term-used`

A rendering marked `deprecated` or `forbidden` in the terminology file was used instead of the approved one; fixed in the translation.

#### Issue 22 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-known-issues-git.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — the terminology file lists `requirements` -> `prérequis` with `deprecated: exigences`.
- **Fix** — in the translation, replace `exigences propres à chaque plateforme` with `prérequis propres à chaque plateforme`.

**Source**
> For detailed steps and platform-specific requirements

**Current translation**
> Pour obtenir des instructions détaillées et connaître les exigences propres à chaque plateforme

**Recommended translation**
> Pour obtenir des instructions détaillées et connaître les prérequis propres à chaque plateforme

**Explanation**
> `Exigences` is a deprecated rendering of `requirements` in the terminology file.

#### Issue 33 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-running.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `change` (noun) -> `modification` with `deprecated: changement`.
- **Fix** — in the translation, replace `du changement éventuel de la source anglaise` with `d'une éventuelle modification de la source anglaise`.

**Source**
> Staleness depends only on whether the English source has changed.

**Current translation**
> L'obsolescence dépend uniquement du changement éventuel de la source anglaise.

**Recommended translation**
> L'obsolescence dépend uniquement d'une éventuelle modification de la source anglaise.

**Explanation**
> `Changement` is a deprecated rendering of the noun `change`; the approved rendering is `modification`.

#### Issue 34 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-creating-review-tasks-role.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `topic` -> `topic` with `deprecated: rubrique`.
- **Fix** — in the translation, replace `Cette rubrique` with `Ce topic`.

**Source**
> This topic explains how Subject-Matter Experts can create and manage their own review tasks.

**Current translation**
> Cette rubrique explique comment les experts en la matière peuvent créer et gérer leurs propres tâches de révision.

**Recommended translation**
> Ce topic explique comment les experts en la matière peuvent créer et gérer leurs propres tâches de révision.

**Explanation**
> `Rubrique` is deprecated; `topic` is the approved rendering and is used in other topics (for example `Ce topic contient des informations…`).

#### Issue 35 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-git-access-tokens.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `topic` -> `topic` with `deprecated: rubrique`.
- **Fix** — in the translation, replace `Cette rubrique décrit` with `Ce topic décrit`.

**Source**
> This topic describes (on a general level) how to create tokens

**Current translation**
> Cette rubrique décrit (de manière générale) comment créer des jetons

**Recommended translation**
> Ce topic décrit (de manière générale) comment créer des jetons

**Explanation**
> `Rubrique` is deprecated; `topic` is the approved rendering.

#### Issue 36 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-publications.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `context DITA map` -> `DITA map contextuelle` with `deprecated: DITA map de contexte`.
- **Fix** — in the translation, replace `la DITA map de contexte` with `la DITA map contextuelle`.

**Source**
> You need to specify a name and the context DITA map

**Current translation**
> Vous devez indiquer un nom et la DITA map de contexte

**Recommended translation**
> Vous devez indiquer un nom et la DITA map contextuelle

**Explanation**
> `DITA map de contexte` is explicitly deprecated; the approved form is `DITA map contextuelle` (also used in `cf-projects-workspace_files_view.dita`).

#### Issue 37 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-review-tasks.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `context DITA map` -> `DITA map contextuelle` with `deprecated: DITA map de contexte`.
- **Fix** — in the translation, replace `la DITA map de contexte` with `la DITA map contextuelle`.

**Source**
> based upon the context DITA map defined in the publication

**Current translation**
> basée sur la DITA map de contexte définie dans la publication

**Recommended translation**
> basée sur la DITA map contextuelle définie dans la publication

**Explanation**
> `DITA map de contexte` is explicitly deprecated; the approved form is `DITA map contextuelle`.

#### Issue 45 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_publications_view.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `context DITA map` -> `DITA map contextuelle` with `deprecated: DITA map de contexte` (2 occurrences in the topic), and `change` -> `modification` with `deprecated: changement`.
- **Fix** — in the translation, replace `la DITA map de contexte` with `la DITA map contextuelle` (both list items) and `Le changement de publication entraîne` with `La modification de la publication entraîne`.

**Source**
> specify the context DITA map and optionally, a DITAVAL filter file ... Changing the publication triggers a reload

**Current translation**
> vous indiquez la DITA map de contexte et, éventuellement, un fichier de filtre DITAVAL ... Le changement de publication entraîne le rechargement

**Recommended translation**
> vous indiquez la DITA map contextuelle et, éventuellement, un fichier de filtre DITAVAL ... La modification de la publication entraîne le rechargement

**Explanation**
> Both renderings are explicitly deprecated in the terminology file.

#### Issue 50 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-commenting-suggesting-role.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `change` -> `modification` with `deprecated: changement`.
- **Fix** — in the translation, replace `proposer des changements précis` with `proposer des modifications précises`.

**Source**
> suggest changes to propose specific edits

**Current translation**
> suggérer des modifications pour proposer des changements précis

**Recommended translation**
> suggérer des modifications pour proposer des corrections précises

**Explanation**
> `Changement` is a deprecated rendering of `change`; the sentence also repeats `modifications`/`changements` for two different source words, so `modifications précises`/`corrections précises` reads better.

#### Issue 55 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-search-syntax-dita.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `topic` -> `topic` with `deprecated: rubrique`.
- **Fix** — in the translation, replace `Cette rubrique décrit` with `Ce topic décrit`.

**Source**
> This topic describes the advanced search features that you can use when searching.

**Current translation**
> Cette rubrique décrit les fonctionnalités de recherche avancée que vous pouvez utiliser lors d'une recherche.

**Recommended translation**
> Ce topic décrit les fonctionnalités de recherche avancée que vous pouvez utiliser lors d'une recherche.

**Explanation**
> `Rubrique` is deprecated; `topic` is the approved rendering.

#### Issue 59 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-unlocking-files.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `change` -> `modification` with `deprecated: changement`.
- **Fix** — in the translation, replace `le changement` with `la modification`.

**Source**
> you might not see the change immediately unless you refresh the page manually

**Current translation**
> vous ne verrez peut-être pas le changement immédiatement, sauf si vous actualisez la page manuellement

**Recommended translation**
> vous ne verrez peut-être pas la modification immédiatement, sauf si vous actualisez la page manuellement

**Explanation**
> `Changement` is a deprecated rendering of the noun `change`.

### `ui-strings-conflicts-with-terminology`

The UI strings file itself contradicts the terminology file, so the translation that applies the UI string correctly violates the approved terminology; fixed in the UI strings file.

#### Issue 13 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-amazon-s3-connector.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — the UI label (ui-strings `upload_output_as_zip`) uses `Téléchargez` for `Upload` (terminology: `upload` -> `téléverser`, forbidden `télécharger`) and `sortie de construction` (terminology: `build` noun -> `build`, deprecated `construction`); the topic copies it faithfully but the preceding step says `téléverser le build`.
- **Fix** — in the UI strings file, change the target of `upload_output_as_zip` to `Téléversez la sortie de build du livrable au format ZIP` (and keep the same label here once the product is localized accordingly); no change to the topic text is needed until then.

**Source**
> <uicontrol>Upload the deliverable's build output in ZIP format</uicontrol>

**Current translation**
> <uicontrol>Téléchargez la sortie de construction du livrable au format ZIP</uicontrol>

**Recommended translation**
> <uicontrol>Téléversez la sortie de build du livrable au format ZIP</uicontrol>

**Explanation**
> `Télécharger` means download and `construction` is a deprecated rendering of `build`; the label as shown in the product contradicts the approved terminology and the surrounding text of the same step.

#### Issue 15 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-closing-tasks.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — the UI labels `Fermer la revue` / `Rouvrir la revue` (ui-strings) use `revue` (terminology: `review` -> `révision`, deprecated `revue`) and `fermer` (terminology: `close` -> `clôturer`, `fermer` only admitted), while the topic title and text use `clôturer` and `révision`.
- **Fix** — in the UI strings file, change the targets of the `Close review` / `Reopen review` strings to `Clôturer la révision` / `Rouvrir la révision`; the topic copies the UI strings correctly and needs no change until then.

**Source**
> click <uicontrol>Close review</uicontrol> ... click <uicontrol>Reopen review</uicontrol>

**Current translation**
> cliquez sur <uicontrol>Fermer la revue</uicontrol> ... cliquer sur <uicontrol>Rouvrir la revue</uicontrol>

**Recommended translation**
> cliquez sur <uicontrol>Clôturer la révision</uicontrol> ... cliquer sur <uicontrol>Rouvrir la révision</uicontrol>

**Explanation**
> The label as displayed contradicts the approved terminology and does not match the topic's own wording (`Clôturer une tâche de révision`, `Révision clôturée`), so the same action is named three ways.

#### Issue 23 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-new-task-from-interface.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings maps `Upload` -> `Transférer` (upload) and `Upload file` -> `Télécharger le fichier` (task.upload.file.button.label), while the terminology file requires `téléverser` and marks `transférer` as deprecated and `télécharger` as forbidden for upload; the topic applies the UI string next to the verb `téléverser`.
- **Fix** — in the UI strings file, change the `upload` target to `Téléverser` and `task.upload.file.button.label` to `Téléverser le fichier`; no change to the topic text until the product is localized accordingly.

**Source**
> To upload a file, click <uicontrol>Upload</uicontrol>

**Current translation**
> Pour téléverser un fichier, cliquez sur <uicontrol>Transférer</uicontrol>

**Recommended translation**
> Pour téléverser un fichier, cliquez sur <uicontrol>Téléverser</uicontrol>

**Explanation**
> The button label contradicts the approved terminology and the verb used in the same sentence; readers see two different words for one action.

#### Issue 39 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-review-tasks.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings gives `Review Status` -> `État de la révision` (review.status.summary), while the terminology file requires `statut de la révision` (`état de la révision` is deprecated); also `Upload` -> `Transférer` (deprecated for upload) and `Close review`/`Reopen review` -> `Fermer la revue`/`Rouvrir la revue` (deprecated `revue`, whereas ui-strings also has `Fermer la révision`/`Rouvrir la révision`).
- **Fix** — in the UI strings file, align `review.status.summary` with `Statut de la révision`, `upload` with `Téléverser`, and keep a single target (`Clôturer la révision`/`Rouvrir la révision`) for `close.review`/`reopen.review`.

**Source**
> <uicontrol>Review Status</uicontrol> box ... <uicontrol>Close review</uicontrol> ... <uicontrol>Upload</uicontrol>

**Current translation**
> zone <uicontrol>État de la révision</uicontrol> ... <uicontrol>Fermer la revue</uicontrol> ... <uicontrol>Transférer</uicontrol>

**Recommended translation**
> zone <uicontrol>Statut de la révision</uicontrol> ... <uicontrol>Clôturer la révision</uicontrol> ... <uicontrol>Téléverser</uicontrol>

**Explanation**
> The topic reproduces UI strings faithfully, but those strings contradict the terminology file, so the same concept is named differently in the same topic (`statut de la révision` in the table paragraph, `État de la révision` for the box).

#### Issue 43 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_changes_view.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — the UI label `New Review Task` -> `Nouvelle tâche de revue` (new.project.task.title) uses `revue`, which the terminology file deprecates (`review task` -> `tâche de révision`); the same sentence otherwise says `tâche de révision`.
- **Fix** — in the UI strings file, change the target to `Nouvelle tâche de révision`; the same label appears in `cf-projects-workspace_files_view.dita` and `cf-projects-workspace_publications_view.dita`.

**Source**
> click the <uicontrol>New Review Task</uicontrol> button

**Current translation**
> cliquez sur le bouton <uicontrol>Nouvelle tâche de revue</uicontrol>

**Recommended translation**
> cliquez sur le bouton <uicontrol>Nouvelle tâche de révision</uicontrol>

**Explanation**
> The approved term is `tâche de révision`; the deprecated `revue` leaks in through the UI strings, creating two names for one concept within a paragraph.

#### Issue 44 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_files_view.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings maps `Upload file`/`Upload folder` -> `Télécharger le fichier`/`Télécharger le dossier` (task.upload.file.button.label, upload.folder), while the terminology file forbids `télécharger` for upload (`téléverser`); the topic keeps the labels in the <dt> and then explains them with `téléverser`. The same topic also reproduces `Nouvelle tâche de revue` (deprecated `revue`).
- **Fix** — in the UI strings file, change the targets to `Téléverser le fichier`, `Téléverser le dossier` and `Nouvelle tâche de révision`; the topic text then needs no change.

**Source**
> <dt>Upload File</dt> ... <dd>Allows you to upload a local file to the workspace.</dd>

**Current translation**
> <dt>Télécharger le fichier</dt> ... <dd>Vous permet de téléverser un fichier local dans l'espace de travail.</dd>

**Recommended translation**
> <dt>Téléverser le fichier</dt> ... <dd>Vous permet de téléverser un fichier local dans l'espace de travail.</dd>

**Explanation**
> `Télécharger` means download; a reader scanning the menu for the entry that matches the description will be misled, and the glossary explicitly forbids this rendering for upload.

#### Issue 46 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_publications_view.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — the UI labels `À partir d'une carte DITA existante` / `À partir d'une nouvelle carte DITA` (ui-strings) render `DITA map` as `carte DITA`, which contradicts the do-not-translate entry `DITA map` (`la DITA map`, not `carte DITA`); `Nouvelle tâche de revue` also uses the deprecated `revue`.
- **Fix** — in the UI strings file, change the targets to `À partir d'une DITA map existante` / `À partir d'une nouvelle DITA map` and `Nouvelle tâche de révision`.

**Source**
> <uicontrol>From existing DITA map</uicontrol> ... <uicontrol>New Review Task</uicontrol>

**Current translation**
> <uicontrol>À partir d'une carte DITA existante</uicontrol> ... <uicontrol>Nouvelle tâche de revue</uicontrol>

**Recommended translation**
> <uicontrol>À partir d'une DITA map existante</uicontrol> ... <uicontrol>Nouvelle tâche de révision</uicontrol>

**Explanation**
> The next sentence says `basée sur une DITA map existante`, so the label and its description name the same object differently.

#### Issue 56 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-dashboard.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — the UI label `Upload` -> `Transférer` (ui-strings `upload`) is introduced by `Pour téléverser un fichier, cliquez sur`; the terminology file deprecates `transférer` and requires `téléverser`.
- **Fix** — in the UI strings file, change the `upload` target to `Téléverser`; the topic needs no change until the product is localized accordingly.

**Source**
> To upload a file to the task, click <uicontrol>Upload</uicontrol> in the header.

**Current translation**
> Pour téléverser un fichier dans la tâche, cliquez sur <uicontrol>Transférer</uicontrol> dans l'en-tête.

**Recommended translation**
> Pour téléverser un fichier dans la tâche, cliquez sur <uicontrol>Téléverser</uicontrol> dans l'en-tête.

**Explanation**
> The button label and the verb in the same sentence differ; see `cf-new-task-from-interface.dita`.

#### Issue 57 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-files.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — the UI label `Upload` -> `Transférer` (ui-strings `upload`) is introduced by `Pour téléverser un fichier, cliquez sur`; the terminology file deprecates `transférer` and requires `téléverser`.
- **Fix** — in the UI strings file, change the `upload` target to `Téléverser`; the topic needs no change until the product is localized accordingly.

**Source**
> To upload a file to the task, click <uicontrol>Upload</uicontrol>.

**Current translation**
> Pour téléverser un fichier dans la tâche, cliquez sur <uicontrol>Transférer</uicontrol>.

**Recommended translation**
> Pour téléverser un fichier dans la tâche, cliquez sur <uicontrol>Téléverser</uicontrol>.

**Explanation**
> Same root cause as in `cf-task-dashboard.dita` and `cf-new-task-from-interface.dita`.

### `status-state-mixed`

`status` was rendered `état` where the terminology file prescribes `statut`; fixed in the translation.

#### Issue 25 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-manage-paid-subscription.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — `subscription status` is rendered `d'état` here but `Statut de l'abonnement` in `cf-buy-organization-subscription.dita`; the terminology file gives `statut` (`état` only for named states of a task, review or job).
- **Fix** — in the translation, replace `section d'état et d'actions de l'abonnement` with `section de statut et d'actions de l'abonnement` (or name the section `Statut de l'abonnement`).

**Source**
> in the subscription status and actions section

**Current translation**
> dans la section d'état et d'actions de l'abonnement

**Recommended translation**
> dans la section de statut et d'actions de l'abonnement

**Explanation**
> `Statut` is the approved rendering for the status of a subscription; using `état` here breaks consistency with the sibling topic.

#### Issue 53 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-renew-organization-subscription.dita`
- **Category** — Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — `subscription status` is rendered `l'état de l'abonnement` here and in `cf-manage-paid-subscription.dita`, but `statut` in `cf-stop-subscription-auto-renewal.dita`, `cf-upgrade-organization-subscription.dita` and `Statut de l'abonnement` in the subscription topics; the terminology file gives `statut`.
- **Fix** — in the translation, replace `section de l'état de l'abonnement et des actions` with `section de statut de l'abonnement et d'actions` in both task topics.

**Source**
> in the subscription status and actions section

**Current translation**
> dans la section de l'état de l'abonnement et des actions

**Recommended translation**
> dans la section de statut de l'abonnement et d'actions

**Explanation**
> Same concept, two renderings across the subscription topics.

### `forbidden-term-used`

A rendering marked `forbidden` in the terminology file appears in the target; fixed in the translation.

#### Issue 48 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects.dita`
- **Category** — Terminology
- **Severity** — Major
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `workflow` -> `flux de travail` with `forbidden: workflow`.
- **Fix** — in the translation, replace `les workflows de révision` with `les flux de travail de révision`.

**Source**
> how they support content management, review workflows, and publishing deliverables

**Current translation**
> la manière dont ils prennent en charge la gestion de contenu, les workflows de révision et la publication de livrables

**Recommended translation**
> la manière dont ils prennent en charge la gestion de contenu, les flux de travail de révision et la publication de livrables

**Explanation**
> `Workflow` is forbidden by the terminology file even where it sounds natural; `flux de travail` is used correctly in nearly every other topic.

#### Issue 51 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-publications-role.dita`
- **Category** — Terminology
- **Severity** — Major
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the terminology file lists `workflow` -> `flux de travail` with `forbidden: workflow`.
- **Fix** — in the translation, replace `les workflows de révision et de publication` with `les flux de travail de révision et de publication`.

**Source**
> a reusable content context for review and publishing workflows

**Current translation**
> comme contexte de contenu réutilisable pour les workflows de révision et de publication

**Recommended translation**
> comme contexte de contenu réutilisable pour les flux de travail de révision et de publication

**Explanation**
> `Workflow` is forbidden by the terminology file.

### `glossary-term-missed`

An approved rendering from the terminology file was not applied; fixed in the translation.

#### Issue 68 — Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/user_interface.dita`
- **Category** — Terminology
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Medium
- **Root cause** — the terminology file defines `help menu` -> `menu d'aide`; the entry `Help Menu` (a descriptive heading marked up as <uicontrol>, not a label shown on screen) was left in English while the rest of the topic says `menu d'aide`.
- **Fix** — in the translation, replace `Help Menu` with `Menu d'aide` (or in the source, mark it up as plain text rather than <uicontrol>).

**Source**
> <uicontrol><image href="../img/CF-Help16.png"/>Help Menu</uicontrol>

**Current translation**
> <uicontrol><image href="../img/CF-Help16.png"/>Help Menu</uicontrol>

**Recommended translation**
> <uicontrol><image href="../img/CF-Help16.png"/>Menu d'aide</uicontrol>

**Explanation**
> Because the string is not a UI label, English leaves a hole in an otherwise French list; if it is meant as a label the UI strings file should give it a row.

## Language Quality

### `ungrammatical-sentence`

A sentence is ungrammatical or garbled in French (missing object, wrong agreement or broken construction); fixed in the translation.

#### Issue 64 — Language Quality

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/making_changes_to_uploaded_files.dita`
- **Category** — Language Quality
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — `choisir pour remplacer le mot` has no object for `choisir`; the source says the user selects one of the suggestions.
- **Fix** — in the translation, rewrite as `dans laquelle vous pouvez choisir celle qui remplacera le mot` (or `sélectionner une suggestion pour remplacer le mot`).

**Source**
> you are presented with a list of suggestions that you can select from to replace the word

**Current translation**
> une liste de suggestions s'affiche, dans laquelle vous pouvez choisir pour remplacer le mot

**Recommended translation**
> une liste de suggestions s'affiche, dans laquelle vous pouvez sélectionner celle qui remplacera le mot

**Explanation**
> The relative clause lost its object during translation, which makes the sentence incorrect French.

### `ui-strings-source-error`

The UI strings file itself contains a spelling or wording error that the translation copies; fixed in the UI strings file.

#### Issue 41 — Language Quality

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace.dita`
- **Category** — Language Quality
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the UI strings file target for `Show only icons` is `Afficher uniquement les icones` (navigation.rail.show.only.icons), missing the circumflex; the topic reproduces it.
- **Fix** — in the UI strings file, correct the target to `Afficher uniquement les icônes` (and the product string); then correct this topic.

**Source**
> <uicontrol>Show only icons</uicontrol>

**Current translation**
> <uicontrol>Afficher uniquement les icones</uicontrol>

**Recommended translation**
> <uicontrol>Afficher uniquement les icônes</uicontrol>

**Explanation**
> `icones` is a misspelling of `icônes`; since the label is copied verbatim the fix belongs in the UI strings file.

### `source-word-order-kept`

English word order or capitalization was kept in a French phrase around a UI label; fixed in the translation.

#### Issue 70 — Language Quality

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/WA-dita-topic-doc-type.dita`
- **Category** — Language Quality
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the English order `<label> Drop-Down Menu` / `<label> submenu` was kept in three entries (`Lier Menu déroulant des actions`, `Insert Section Menu déroulant`, `Table sous-menu`), with a capital M mid-sentence, while sibling entries use the French order (`Sous-menu <uicontrol>Insérer</uicontrol>`, `Menu déroulant <uicontrol>Plus</uicontrol>` in other topics).
- **Fix** — in the translation, reorder to the French pattern: `Menu déroulant des actions <uicontrol>Lier</uicontrol>`, `Menu déroulant <uicontrol>Insert Section</uicontrol>`, `Sous-menu <uicontrol>Table</uicontrol>`.

**Source**
> <uicontrol>Insert Section</uicontrol> Drop-Down Menu ... <uicontrol>Table</uicontrol> submenu

**Current translation**
> <uicontrol>Insert Section</uicontrol> Menu déroulant ... <uicontrol>Table</uicontrol> sous-menu

**Recommended translation**
> Menu déroulant <uicontrol>Insert Section</uicontrol> ... Sous-menu <uicontrol>Table</uicontrol>

**Explanation**
> The qualifier follows the English position and the capital letter is wrong in French; the same topic uses the correct order elsewhere.

### `label-inflected-in-sentence`

A UI label was inserted into a sentence without the supporting noun or agreement the instructions require; fixed in the translation.

#### Issue 38 — Language Quality

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-review-tasks.dita`
- **Category** — Language Quality
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — the status label `Intégré` is used as a bare attributive modifier (`Les tâches Intégré`), which is ungrammatical in French; the project instructions say to add a noun instead of inflecting the label.
- **Fix** — in the translation, rephrase with a noun, e.g. `Les tâches ayant le statut <uicontrol>Intégré</uicontrol>`.

**Source**
> <uicontrol>Integrated</uicontrol> tasks are not displayed by default.

**Current translation**
> Les tâches <uicontrol>Intégré</uicontrol> ne sont pas affichées par défaut.

**Recommended translation**
> Les tâches ayant le statut <uicontrol>Intégré</uicontrol> ne sont pas affichées par défaut.

**Explanation**
> A label must stay unchanged but the sentence must remain grammatical; a noun such as `statut` solves both.

### `elision-broken-by-line-break`

A typographic rule of the target language (elision, spacing or punctuation) was not applied or was broken by line wrapping; fixed in the translation.

#### Issue 47 — Language Quality

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects.dita`
- **Category** — Language Quality
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the source line is wrapped right after the elided article `l'`, so the whitespace between `l'` and `interface` renders as a visible space (`l' interface`).
- **Fix** — in the translation, rejoin the elision: `composants principaux de l'interface de navigateur`.

**Source**
> one of the two main components in the Content Fusion browser interface

**Current translation**
> est l'un des deux composants principaux de l'

**Recommended translation**
> est l'un des deux composants principaux de l'interface de navigateur de Content Fusion

**Explanation**
> In XML whitespace content, a line break after an apostrophe becomes a space in the output; the elision must stay attached to the next word.

## Accuracy and Completeness

### `source-defect-propagated`

The English source contains an error that was translated faithfully; fixed in the source.

#### Issue 7 — Accuracy and Completeness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/CF-dita-map-tree-editor.dita`
- **Category** — Accuracy and Completeness
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the English source describes `Move Down` as `Move the reference up.`; the French copies the error.
- **Fix** — in the source, change the description of `Move Down` to `Move the reference down.`, then re-translate; until then, correct the French locally to `vers le bas`.

**Source**
> Move Down — Move the reference up.

**Current translation**
> <uicontrol>Move Down</uicontrol> ... Déplace la référence vers le haut.

**Recommended translation**
> Déplace la référence vers le bas.

**Explanation**
> The description of `Move Down` states the opposite action. The translation is faithful but reproduces a documentation defect that the translator could have flagged.

#### Issue 63 — Accuracy and Completeness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/known_issues.dita`
- **Category** — Accuracy and Completeness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Medium
- **Root cause** — the English source misspells the page name `Adminstration` and the French reproduces it inside the UI label.
- **Fix** — in the source, correct `Adminstration Page` to `Administration Page`, then re-translate (the French UI label is probably `Page d'administration`).

**Source**
> <uicontrol>Content Fusion Adminstration Page</uicontrol>

**Current translation**
> <uicontrol>Content Fusion Adminstration Page</uicontrol>

**Recommended translation**
> <uicontrol>Content Fusion Administration Page</uicontrol>

**Explanation**
> A typo in the source label is carried into the target; fixing it in the source avoids propagating it to every language.

#### Issue 72 — Accuracy and Completeness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/WA-dita-topic-doc-type.dita`
- **Category** — Accuracy and Completeness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Medium
- **Root cause** — the English description of `Open Image` says `Surrounds the selected image in a new tab` (a copy-paste error from the Bold/Italic entries); the French silently corrects it to `Ouvre l'image sélectionnée dans un nouvel onglet`.
- **Fix** — in the source, change `Surrounds` to `Opens` so source and translation agree; the French wording is right.

**Source**
> Surrounds the selected image in a new tab.

**Current translation**
> Ouvre l'image sélectionnée dans un nouvel onglet.

**Recommended translation**
> Ouvre l'image sélectionnée dans un nouvel onglet. (keep; fix the English source)

**Explanation**
> The translator changed the meaning relative to the source without flagging it; this needs a source fix so every language benefits.

#### Issue 75 — Accuracy and Completeness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/content-fusion_vs_web-author.dita`
- **Category** — Accuracy and Completeness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Medium
- **Root cause** — the English source has a missing noun (`The  simply follows the link`); the French silently supplies `L'expert`.
- **Fix** — in the source, restore the missing word (`The expert simply follows the link`); the French is correct.

**Source**
> The  simply follows the link to access the review task in a browser

**Current translation**
> L'expert suit simplement le lien pour accéder à la tâche de révision dans un navigateur

**Recommended translation**
> L'expert suit simplement le lien pour accéder à la tâche de révision dans un navigateur (keep; fix the English source)

**Explanation**
> A source defect was repaired in the translation without being reported, so other languages may reproduce the gap.

### `imprecise-rendering-of-meaning`

The French wording is plausible but blurs or slightly shifts the source meaning; fixed in the translation.

#### Issue 31 — Accuracy and Completeness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-subscription.dita`
- **Category** — Accuracy and Completeness
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — the feminine plural `réactivées` agrees with `leurs données`, so the French says the data is reactivated, while the English (and the rest of the product) means the inactive users are reactivated by an administrator.
- **Fix** — in the translation, rephrase so the participle refers to the users, e.g. `mais leurs données restent disponibles et ces utilisateurs peuvent être réactivés par un administrateur`.

**Source**
> Inactive users do not count against license limits, but their data remains available and can be reactivated by an administrator.

**Current translation**
> Les utilisateurs inactifs ne sont pas comptabilisés dans les limites de licence, mais leurs données restent disponibles et peuvent être réactivées par un administrateur.

**Recommended translation**
> Les utilisateurs inactifs ne sont pas comptabilisés dans les limites de licence, mais leurs données restent disponibles et ils peuvent être réactivés par un administrateur.

**Explanation**
> Grammatical agreement turns an ambiguous English clause into a nonsensical one (reactivating data); the intended subject is the user account.

#### Issue 1 — Accuracy and Completeness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/topics/reusables-cf-wa-waCustom.dita`
- **Category** — Accuracy and Completeness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Medium
- **Root cause** — `exclus du proxy` does not say that the connection bypasses the proxy.
- **Fix** — in the translation, replace `exclus du proxy` with `contournés par le proxy`.

**Source**
> Comma-separated list of hosts that is bypassed by the proxy.

**Current translation**
> Liste d'hôtes séparés par des virgules qui sont exclus du proxy.

**Recommended translation**
> Liste d'hôtes séparés par des virgules qui sont contournés par le proxy.

**Explanation**
> "Bypassed by the proxy" means traffic to these hosts goes direct; "exclus du proxy" can be read as hosts the proxy refuses.

#### Issue 9 — Accuracy and Completeness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-data-handling.dita`
- **Category** — Accuracy and Completeness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Low
- **Root cause** — `révisé` reads as `already revised`, whereas `reviewed workflow` means a workflow built around review.
- **Fix** — in the translation, rephrase as `un flux de travail soumis à révision et réversible`.

**Source**
> Translation in Content Fusion is a reviewed, reversible workflow.

**Current translation**
> La traduction dans Content Fusion est un flux de travail révisé et réversible.

**Recommended translation**
> La traduction dans Content Fusion est un flux de travail soumis à révision et réversible.

**Explanation**
> `Révisé` describes something that has been corrected, not a process in which the output is reviewed before acceptance, which is what the following sentences explain.

#### Issue 14 — Accuracy and Completeness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation.dita`
- **Category** — Accuracy and Completeness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Low
- **Root cause** — same wording as in `cf-ai-translation-data-handling.dita`: `révisé` reads as `already revised`, whereas `reviewed workflow` means a workflow built around review.
- **Fix** — in the translation, rephrase as `un flux de travail soumis à révision et réversible`.

**Source**
> Translation is a reviewed, reversible workflow.

**Current translation**
> La traduction est un flux de travail révisé et réversible.

**Recommended translation**
> La traduction est un flux de travail soumis à révision et réversible.

**Explanation**
> `Révisé` describes something that has been corrected, not a process in which the output is reviewed before acceptance.

### `ui-strings-source-error`

The UI strings file itself contains a spelling or wording error that the translation copies; fixed in the UI strings file.

#### Issue 60 — Accuracy and Completeness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/known_issues.dita`
- **Category** — Accuracy and Completeness
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — the UI strings file target for `upload-only-first-level-references` says `dossiers à examiner` (folders) for `files to be reviewed`; the topic copies it (and the sentence is an imperative in a checkbox label).
- **Fix** — in the UI strings file, correct the target to `Téléverser uniquement les ressources directement référencées dans les fichiers à réviser` (and the product string); then correct this topic.

**Source**
> <uicontrol>Upload only resources that are directly referenced in the files to be reviewed.</uicontrol>

**Current translation**
> <uicontrol>Ne téléversez que les ressources qui sont directement référencées dans les dossiers à examiner.</uicontrol>

**Recommended translation**
> <uicontrol>Téléverser uniquement les ressources directement référencées dans les fichiers à réviser</uicontrol>

**Explanation**
> `Files` was rendered `dossiers` (folders), which changes the meaning of the option; the same sentence two paragraphs later correctly says `fichiers à réviser`.

## Consistency

### `label-language-depends-on-markup`

The same concept or label is rendered in different ways in different places of the set; fixed in the translation (and the UI strings file where a row is missing).

#### Issue 69 — Consistency

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/WA-dita-map-doc-type.dita`
- **Category** — Consistency
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — the same Web Author label is localized when it is plain text in a <dt> (`Afficher le contenu des topics`, `Afficher les références de topic`, `Inspecter les styles`) but left in English when it is wrapped in <uicontrol> (`View Topic Content`, `Define Variable (as DITA Key)`, `CSS Inspector`); the description of `Modifier le contenu des topics` even refers to the entry as `View Topic Content`.
- **Fix** — in the translation, decide whether the Web Author action labels are shown in English or French in the product and apply the same language to every occurrence (heading and cross-references); if the product is localized, add the missing rows to the UI strings file.

**Source**
> Unlike <uicontrol>View Topic Content</uicontrol>, the topic content is editable.

**Current translation**
> Contrairement à <uicontrol>View Topic Content</uicontrol>, le contenu des topics est modifiable. (dt: Afficher le contenu des topics)

**Recommended translation**
> Contrairement à <uicontrol>Afficher le contenu des topics</uicontrol>, le contenu des topics est modifiable.

**Explanation**
> A reader scanning the list sees `Afficher le contenu des topics` but is told to compare with `View Topic Content`; the label translation depends on markup rather than on the product.

#### Issue 71 — Consistency

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/WA-dita-topic-doc-type.dita`
- **Category** — Consistency
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — dialog and action names are French in figure titles and prose (`Boîte de dialogue Configurer le contexte DITA`, `Configurer le contexte DITA`, `Choisir le style` in the editor topic) but English in <uicontrol> (`Configure DITA Context`, `Choose style`) and in the figure title `Boîte de dialogue Choose Style`.
- **Fix** — in the translation, use one language for each label across the topic and `making_changes_to_uploaded_files.dita` (for instance keep the Web Author labels in English everywhere, or translate everywhere).

**Source**
> select <uicontrol>Choose style</uicontrol> ... <title>Choose Style Dialog Box</title>

**Current translation**
> sélectionnez <uicontrol>Choose style</uicontrol> ... <title>Boîte de dialogue Choose Style</title>

**Recommended translation**
> sélectionnez <uicontrol>Choisir le style</uicontrol> ... <title>Boîte de dialogue Choisir le style</title>

**Explanation**
> The same dialog is called `Choose Style`, `Choose style` and `Choisir le style` depending on the place.

#### Issue 77 — Consistency

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-reviews-search-tab.dita (98); DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-reviews-view.dita`
- **Category** — Consistency
- **Severity** — Minor
- **Issue type** — Same UI label ("Time" filter) rendered three ways
- **Confidence** — Medium
- **Root cause** — ui-strings gives "Time" → "Temps", while the filter is rendered "Heure" in cf-reviews-search-tab.dita and "Période" in cf-task-reviews-view.dita; the options use "Toute la période".
- **Fix** — Use one label for the filter in both topics and in ui-strings; "Période" matches the option values ("Toute la période") and is the better French.

**Source**
> Time - The time range for the review. Default: All Time.

**Current translation**
> <b>Heure</b> - La période de l'avis. Par défaut&#160;: <uicontrol>Toute la période</uicontrol>.

**Recommended translation**
> <b>Période</b> - La période de l'avis. Par défaut&#160;: <uicontrol>Toute la période</uicontrol>.

**Explanation**
> Three renderings of one filter label (Temps / Heure / Période). "Heure" means a clock time and does not fit a date range. The ui-strings row "time → Temps" should be changed to "Période" so that the translators follow it.

#### Issue 78 — Consistency

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-closing-tasks.dita (33); DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-review-tasks.dita (80); DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-status.dita (114); DITA-cf/i18n/fusion-cloud/fr-FR/topics/review-task-header.dita (128); DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-integrating-review-tasks.dita (53); DITA-cf/i18n/fusion-cloud/fr-FR/topics/content_fusion_task_details.dita (121); DITA-cf/i18n/fusion-cloud/fr-FR/topics/types_of_review_tasks.dita (132)`
- **Category** — Consistency
- **Severity** — Minor
- **Issue type** — Same UI concept rendered with different words (revue / révision, clôturée / terminé, Intégration / Intégration en cours)
- **Confidence** — High
- **Root cause** — ui-strings has duplicate rows for the same source: close.review "Fermer la revue" vs close_review "Fermer la révision"; reopen.review "Rouvrir la revue" vs open_review "Rouvrir la révision"; review.closed "Revue terminé" vs review_closed "Révision clôturée"; integrating "Intégration en cours" vs integrating_review "Intégration". The topics follow different rows.
- **Fix** — Keep one wording per concept in ui-strings (for example "Fermer la révision", "Rouvrir la révision", "Révision clôturée", "Intégration en cours") and apply it in every topic; correct the agreement error in "Revue terminé".

**Source**
> Close review / Reopen review / Review closed / Integrating

**Current translation**
> cf-closing-tasks: Fermer la revue, Rouvrir la revue, Révision clôturée; cf-task-status and review-task-header: Rouvrir la révision; cf-projects-review-tasks: Revue terminé, Intégration en cours; cf-task-status and types_of_review_tasks: Intégration

**Recommended translation**
> Fermer la révision / Rouvrir la révision / Révision clôturée / Intégration en cours (one set everywhere)

**Explanation**
> The same buttons and statuses carry two names, so the user cannot match the text to the interface. "Revue terminé" is also ungrammatical (revue is feminine: "terminée"). The root cause is the duplicate rows in ui-strings, which should be merged.

#### Issue 79 — Consistency

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-reviews-search-tab.dita (98); DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-reviews-view.dita (111); DITA-cf/i18n/fusion-cloud/fr-FR/reusables/wa-shared/reusables-wa-shared.dita (6); DITA-cf/i18n/fusion-cloud/fr-FR/topics/making_changes_to_uploaded_files.dita (126); DITA-cf/i18n/fusion-cloud/fr-FR/topics/user_interface.dita (133)`
- **Category** — Consistency
- **Severity** — Minor
- **Issue type** — Same term rendered two ways (surlignage / surbrillance)
- **Confidence** — High
- **Root cause** — ui-strings row "highlight" gives "Surbrillance" (Type filter option); the other topics use "surbrillance" but cf-reviews-search-tab.dita writes "surlignage".
- **Fix** — Use "surbrillance" in cf-reviews-search-tab.dita.

**Source**
> The review type (for example, comment or highlight).

**Current translation**
> Le type d'avis (par exemple, commentaire ou surlignage).

**Recommended translation**
> Le type d'avis (par exemple, commentaire ou surbrillance).

**Explanation**
> One of the Type filter values is called "surbrillance" in ui-strings and in cf-task-reviews-view.dita but "surlignage" in cf-reviews-search-tab.dita.

#### Issue 81 — Consistency

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-authentication.dita (61); DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organizations-management.dita (68)`
- **Category** — Consistency
- **Severity** — Minor
- **Issue type** — Same term rendered two ways (domaines d'e-mail / domaines de messagerie)
- **Confidence** — High
- **Root cause** — The same feature, "approved email domains", is "domaines d'e-mail approuvés" in cf-organization-authentication.dita and "domaines de messagerie approuvés" in cf-organizations-management.dita; the glossary spells e-mail "e-mail".
- **Fix** — Use "domaines d'e-mail approuvés" in both files.

**Source**
> approved email domains

**Current translation**
> les domaines de messagerie approuvés

**Recommended translation**
> les domaines d'e-mail approuvés

**Explanation**
> The two topics describe the same setting with different names.

#### Issue 83 — Consistency

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/CF-dita-map-tree-editor.dita (8); DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_translation_jobs_view.dita (17)`
- **Category** — Consistency
- **Severity** — Minor
- **Issue type** — Same view named two ways (Carte de publication / Publication)
- **Confidence** — Medium
- **Root cause** — Both xrefs point to cf-projects-workspace_publications_view.dita, whose title is "Vue Carte de publication de l'espace de travail". File 8 names the view "Carte de publication" and file 17 names it "Publication".
- **Fix** — Use the same UI label (the one in the target topic title, "Carte de publication") in both xrefs.

**Source**
> Publication Map view

**Current translation**
> vue <uicontrol>Publication</uicontrol> (file 17); vue latérale <uicontrol>Carte de publication</uicontrol> (file 8)

**Recommended translation**
> vue <uicontrol>Carte de publication</uicontrol>

**Explanation**
> One view carries two UI names across topics, and file 17's label matches neither the title it links to nor file 8.

#### Issue 80 — Consistency

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-reviews-search-tab.dita (98); DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-reviews-view.dita (111); DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-subscription-statuses.dita (66); DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-subscription.dita (67)`
- **Category** — Consistency
- **Severity** — Suggestion
- **Issue type** — Same term rendered two ways (puce / pastille)
- **Confidence** — Medium
- **Root cause** — Filter chips are called "puces" in cf-reviews-search-tab.dita and "pastilles" in cf-task-reviews-view.dita, which describes the same kind of element.
- **Fix** — Use "pastilles" for filter chips in both topics ("puce" also means a list bullet in French).

**Source**
> they appear as chips below the search box (each chip shows the filter icon and value)

**Current translation**
> ils apparaissent sous forme de puces sous le champ de recherche (chaque puce affiche l'icône du filtre et la valeur)

**Recommended translation**
> ils apparaissent sous forme de pastilles sous le champ de recherche (chaque pastille affiche l'icône du filtre et la valeur)

**Explanation**
> Two sibling topics describe the same filter chips with different words; "puce" is ambiguous with a bullet point.

#### Issue 82 — Consistency

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-reviewing.dita cross-references in files 13, 16, 19, 26; DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-running.dita cross-references in files 19, 20, 21`
- **Category** — Consistency
- **Severity** — Suggestion
- **Issue type** — Cross-reference text differs from the target topic title
- **Confidence** — Medium
- **Root cause** — The English xref text equals the topic title ("Running an Incremental Translation"), but the French xref text is a different form ("Exécution d'une traduction incrémentielle" vs the title "Exécuter une traduction incrémentielle"; "Révision des traductions avant de les valider" vs "Réviser les traductions avant de les valider").
- **Fix** — Copy the French topic title into the xref text, or omit the text so it is generated from the title.

**Source**
> Running an Incremental Translation

**Current translation**
> Exécution d'une traduction incrémentielle

**Recommended translation**
> Exécuter une traduction incrémentielle

**Explanation**
> Titles and links to them read as different topics. Same pattern for "Application de la terminologie et des glossaires" (file 15) vs "Imposer la terminologie et les glossaires" (title).

### `glossary-term-missed`

An approved rendering from the terminology file was not applied; fixed in the translation.

#### Issue 76 — Consistency

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/topics/reusables-cf.dita (4); DITA-cf/i18n/fusion-cloud/fr-FR/reusables/topics/reusables-cf-wa-waCustom.dita (3)`
- **Category** — Consistency
- **Severity** — Minor
- **Issue type** — Inconsistent term rendering (case)
- **Confidence** — High
- **Root cause** — The glossary entry "web" gives the target "Web" with case: keep, and the rest of the set writes "navigateur Web", "page Web", "plateforme Web"; two files use lowercase "web".
- **Fix** — Capitalize "Web" in both files.

**Source**
> Access the Content Fusion web administration interface at ...

**Current translation**
> Accédez à l'interface web d'administration de

**Recommended translation**
> Accédez à l'interface Web d'administration de

**Explanation**
> Files 4 (reusables-cf.dita, "interface web") and 3 (reusables-cf-wa-waCustom.dita, "serveur de l'éditeur web", twice) use lowercase "web", while the glossary mandates "Web" (case: keep) and the other files write "Web".

## Style and Naturalness

### `source-language-calque`

English sentence structure or idiom was carried over literally into French; fixed in the translation.

#### Issue 4 — Style and Naturalness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/topics/reusables-cf.dita`
- **Category** — Style and Naturalness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Medium
- **Root cause** — `vous pouvez souhaiter` is a literal rendering of `you may want to`.
- **Fix** — in the translation, rephrase as `vous souhaiterez peut-être limiter`.

**Source**
> (you may want to restrict access to only have this page available to certain computers)

**Current translation**
> (vous pouvez souhaiter limiter l'accès à cette page à certains ordinateurs uniquement)

**Recommended translation**
> (vous souhaiterez peut-être limiter l'accès à cette page à certains ordinateurs uniquement)

**Explanation**
> `Pouvoir souhaiter` is not idiomatic French; the suggested form conveys the same advisory tone naturally.

#### Issue 12 — Style and Naturalness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-jobs.dita`
- **Category** — Style and Naturalness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Medium
- **Root cause** — `menu de débordement` is a word-for-word rendering of `overflow menu` (also used for `Mark as not integrated` later in the topic).
- **Fix** — in the translation, replace `menu de débordement` with `menu d'actions supplémentaires` (both occurrences), or `menu à points de suspension`, consistent with the ellipsis menu described a few paragraphs earlier.

**Source**
> You can also use the card's overflow menu to remove the job.

**Current translation**
> Vous pouvez également utiliser le menu de débordement de la fiche pour supprimer la tâche.

**Recommended translation**
> Vous pouvez également utiliser le menu d'actions supplémentaires de la fiche pour supprimer la tâche.

**Explanation**
> `Débordement` is not a term French readers associate with a menu; the topic itself calls the same control the `menu des points de suspension verticaux`, so two names are used for one control.

#### Issue 73 — Style and Naturalness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/WA-dita-topic-doc-type.dita`
- **Category** — Style and Naturalness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Low
- **Root cause** — `sans quitter le clavier des doigts` is a literal rendering of `without having to take your fingers off the keyboard`.
- **Fix** — in the translation, rephrase as `sans lâcher le clavier`.

**Source**
> without having to take your fingers off the keyboard

**Current translation**
> sans quitter le clavier des doigts

**Recommended translation**
> sans lâcher le clavier

**Explanation**
> The French verb construction is unidiomatic; a shorter native idiom conveys the same idea.

### `unnatural-wording`

The wording is understandable but reads as a translation rather than native technical French; fixed in the translation.

#### Issue 5 — Style and Naturalness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/wa-shared/reusables-wa-shared.dita`
- **Category** — Style and Naturalness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Low
- **Root cause** — `pli` for the editor `fold` is a literal noun that is uncommon in French software documentation.
- **Fix** — in the translation, rephrase, e.g. `Bascule entre l'état replié et l'état déplié de l'élément actuel`.

**Source**
> Toggles the state of the current fold.

**Current translation**
> Bascule l'état du pli actuel.

**Recommended translation**
> Bascule l'élément actuel entre l'état replié et l'état déplié.

**Explanation**
> `Pli` is a calque of `fold`; describing the collapsed/expanded state is what French readers expect and matches the neighbouring `Replie`/`Déplie` entries.

#### Issue 8 — Style and Naturalness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-functionality-role.dita`
- **Category** — Style and Naturalness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Medium
- **Root cause** — `à aider pour les tâches de rédaction` is clumsy (`aider à`/`aider pour`), and `l'affinage du contenu` is a stiff rendering of `content refinement`.
- **Fix** — in the translation, rephrase as `Ces fonctionnalités visent à faciliter les tâches de rédaction, l'amélioration du contenu et d'autres activités de création`.

**Source**
> These features are intended to help with writing tasks, content improvement, and other authoring activities.

**Current translation**
> Ces fonctionnalités sont destinées à aider pour les tâches de rédaction, l'amélioration du contenu et d'autres activités de création.

**Recommended translation**
> Ces fonctionnalités visent à faciliter les tâches de rédaction, l'amélioration du contenu et d'autres activités de création.

**Explanation**
> `Aider pour` is not idiomatic; `faciliter` reads naturally and is already used elsewhere in the same topic.

### `non-translatable-markup-translated`

Internal markup that is not reader-facing content was translated; fixed in the translation or in the validation rules.

#### Issue 30 — Style and Naturalness

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-settings.dita`
- **Category** — Style and Naturalness
- **Severity** — Suggestion
- **Issue type** — Language improvement
- **Confidence** — Low
- **Root cause** — the `comment` attribute of an `<?oxy_comment_start?>` processing instruction (an internal author review comment) was translated; it is not content shown to readers.
- **Fix** — in the translation, leave the processing-instruction comment unchanged (or remove it from the shipped copy); consider adding processing instructions to the do-not-translate rules.

**Source**
> <?oxy_comment_start author="cristi_talau" ... comment="Are not there yet."?>

**Current translation**
> <?oxy_comment_start author="cristi_talau" ... comment="Pas encore disponibles."?>

**Recommended translation**
> <?oxy_comment_start author="cristi_talau" ... comment="Are not there yet."?>

**Explanation**
> A processing-instruction attribute is tooling metadata; translating it creates a needless diff from the source and has no value for readers.

## UI Terminology

### `ui-label-left-in-english`

A UI label that has a row in the UI strings file (matching up to a trailing ellipsis or a small wording difference) was left in English; fixed in the translation.

#### Issue 3 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/topics/reusables-cf.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `Merge into current branch...` -> `Fusionner dans la branche actuelle...` (merge.branch.action); only the trailing ellipsis differs from the source label, yet the label was left in English while sibling `Supprimer la branche` and `Fusionner la branche` were translated.
- **Fix** — in the translation, use `Fusionner dans la branche actuelle` (and `Créer une branche` for create.branch / `Create new branch` if it names the same menu item).

**Source**
> <uicontrol>Merge into current branch</uicontrol>

**Current translation**
> <uicontrol>Merge into current branch</uicontrol> - Ouvre une boîte de dialogue

**Recommended translation**
> <uicontrol>Fusionner dans la branche actuelle</uicontrol> - Ouvre une boîte de dialogue

**Explanation**
> Readers look for the localized menu item; the product shows `Fusionner dans la branche actuelle...`. The topic mixes translated and English menu items in one list.

#### Issue 6 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/CF-dita-map-tree-editor.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has `Report problem` -> `Signaler un problème` (report_problem); the source label differs only by capital P, yet `Report Problem` was left in English.
- **Fix** — in the translation, replace `Report Problem` with `Signaler un problème`.

**Source**
> <dt>Report Problem</dt>

**Current translation**
> <dt>Report Problem</dt>

**Recommended translation**
> <dt>Signaler un problème</dt>

**Explanation**
> The label exists in the localized product; readers will see `Signaler un problème` on screen. `Edit in Author Mode` in the preceding entry has no ui-strings row and may stay in English.

#### Issue 10 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-getting-started.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `Target Languages` -> `Langues cibles` (target.language, label of the multi-select field); the singular source label was left in English.
- **Fix** — in the translation, use the localized field label `Langues cibles` (and consider fixing the source to the plural form shown in the product).

**Source**
> one or more <uicontrol>Target Language</uicontrol> values

**Current translation**
> une ou plusieurs valeurs de <uicontrol>Target Language</uicontrol>

**Recommended translation**
> une ou plusieurs valeurs dans le champ <uicontrol>Langues cibles</uicontrol>

**Explanation**
> The field is displayed as `Langues cibles` in the localized product, so readers will not find a field named `Target Language`.

#### Issue 11 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-index-conflicts.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has the pattern `Keep {destinationBranch} changes` -> `Garder les modifications de {destinationBranch}` (keep.destination.changes / keep.source.changes); the labels with the branch names filled in were left in English.
- **Fix** — in the translation, write `Garder les modifications de main` and `Garder les modifications de dev` (placeholder filled with the branch name, as the instructions require).

**Source**
> Do not choose <uicontrol>Keep main changes</uicontrol> or <uicontrol>Keep dev changes</uicontrol>

**Current translation**
> Ne choisissez pas <uicontrol>Keep main changes</uicontrol> ni <uicontrol>Keep dev changes</uicontrol>

**Recommended translation**
> Ne choisissez pas <uicontrol>Garder les modifications de main</uicontrol> ni <uicontrol>Garder les modifications de dev</uicontrol>

**Explanation**
> The label template exists in the localized product; the instructions say to fill placeholders with the actual value, so these two buttons appear in French on screen while the surrounding sentence names them in English.

#### Issue 16 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-concurrent-editing.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `Enable concurrent editing` -> `Activer l'édition simultanée` and `Task settings` -> `Paramètres de la tâche`; the source labels differ only by capitalization, yet both were left in English.
- **Fix** — in the translation, use `Activer l'édition simultanée` and `Paramètres de la tâche`.

**Source**
> the <uicontrol>Enable Concurrent Editing</uicontrol> option in the <uicontrol>Task Settings</uicontrol> page

**Current translation**
> l'option <uicontrol>Enable Concurrent Editing</uicontrol> de la page <uicontrol>Task Settings</uicontrol>

**Recommended translation**
> l'option <uicontrol>Activer l'édition simultanée</uicontrol> de la page <uicontrol>Paramètres de la tâche</uicontrol>

**Explanation**
> A label that differs from a ui-strings row only by capitalization is the same label; readers see the French labels on screen. The topic's own title and index terms already use `édition simultanée`.

#### Issue 17 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-getting-started-forgot-password.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `Forgot your password?` -> `Mot de passe oublié?` (password.forgot) and `Log In` -> `Connexion` (login.verb); both labels differ from the source only by case or a trailing `?`, yet were left in English (4 occurrences of `Log in` / `Forgot your password`).
- **Fix** — in the translation, use the localized labels `Connexion` and `Mot de passe oublié` for every occurrence in the topic.

**Source**
> the <uicontrol>Forgot your password</uicontrol> link in the <uicontrol>Log in</uicontrol> form

**Current translation**
> du lien <uicontrol>Forgot your password</uicontrol> dans le formulaire <uicontrol>Log in</uicontrol>

**Recommended translation**
> du lien <uicontrol>Mot de passe oublié</uicontrol> dans le formulaire <uicontrol>Connexion</uicontrol>

**Explanation**
> The login page and the reset link are displayed in French in the localized product, so readers will not find `Log in` or `Forgot your password` on screen. The sibling topic `cf-getting-started-login-organization.dita` already uses the localized `Je connais mon ID d'organisation`.

#### Issue 18 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-git-access-tokens.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has `Import from Git` -> `Importer depuis Git` (import.from.git); the label (marked up with <b>, not <uicontrol>) was left in English. The same miss occurs in `cf-known-issues-git.dita`.
- **Fix** — in the translation, use `Importer depuis Git`; also review other UI labels marked up with <b> against the UI strings file.

**Source**
> via the <b>Import from Git</b> option

**Current translation**
> via l'<xref ...>option <b>Import from Git</b></xref>

**Recommended translation**
> via l'<xref ...>option <b>Importer depuis Git</b></xref>

**Explanation**
> The option is displayed as `Importer depuis Git` in the localized product; the label here is not found on screen. The label is not wrapped in <uicontrol>, which is probably why the lookup was skipped.

#### Issue 20 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-how-to-find-reviews-where-mentioned.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `Time` -> `Temps` (the label of the Time filter in the In Reviews tab); the filter list renders it as `Heure`, which is not what appears on screen.
- **Fix** — in the translation, replace `Heure` with `Temps` in the list of filters.

**Source**
> (Type, Status, Author, Time)

**Current translation**
> (Type, Statut, Auteur, Heure)

**Recommended translation**
> (Type, Statut, Auteur, Temps)

**Explanation**
> Filter names must match the localized labels shown in the filter popover (`Statut`, `Auteur`, `Temps`).

#### Issue 21 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-known-issues-git.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has `Import from Git` -> `Importer depuis Git` (import.from.git); the label marked up with <b> was left in English.
- **Fix** — in the translation, use `Importer depuis Git`.

**Source**
> the <b>Import from Git</b> option

**Current translation**
> l'<xref ...>option <b>Import from Git</b></xref>

**Recommended translation**
> l'<xref ...>option <b>Importer depuis Git</b></xref>

**Explanation**
> The option is displayed as `Importer depuis Git` in the localized product.

#### Issue 24 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-new-task-from-interface.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `New file` -> `Nouveau fichier` and `Task settings` -> `Paramètres de la tâche`; the source labels differ only by capitalization, yet both were left in English (the same topic translates `Settings` -> `Paramètres` and `New Task` -> `Nouvelle tâche`).
- **Fix** — in the translation, use `Nouveau fichier` and `Paramètres de la tâche`.

**Source**
> click <uicontrol>New File</uicontrol> ... to open <uicontrol>Task Settings</uicontrol>

**Current translation**
> cliquez sur <uicontrol>New File</uicontrol> ... pour ouvrir <uicontrol>Task Settings</uicontrol>

**Recommended translation**
> cliquez sur <uicontrol>Nouveau fichier</uicontrol> ... pour ouvrir <uicontrol>Paramètres de la tâche</uicontrol>

**Explanation**
> The labels are displayed in French in the localized product; the topic mixes localized and non-localized labels in the same procedure.

#### Issue 26 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-members.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has `(Inactive)` -> `(Inactif)` (user.inactive.suffix, the suffix shown after the user name); the label (marked up with <b>) was left in English.
- **Fix** — in the translation, replace `(Inactive)` with `(Inactif)`.

**Source**
> with the label <b>(Inactive)</b>

**Current translation**
> avec l'étiquette <b>(Inactive)</b>

**Recommended translation**
> avec l'étiquette <b>(Inactif)</b>

**Explanation**
> The suffix is displayed as `(Inactif)` in the localized product, so readers will not find `(Inactive)` on screen.

#### Issue 27 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-security.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `Only allow connections to these trusted hosts (one per line):` -> `Autoriser uniquement les connexions à ces hôtes approuvés (une par ligne) :`; the label differs from the source only by the trailing colon, yet the <dt> was left in English while the rest of the topic is translated.
- **Fix** — in the translation, use `Autoriser uniquement les connexions à ces hôtes approuvés (une par ligne)` for the <dt> and the same label in the description.

**Source**
> <dt>Only allow connections to these trusted hosts (one per line)</dt>

**Current translation**
> <dt>Only allow connections to these trusted hosts (one per line)</dt>

**Recommended translation**
> <dt>Autoriser uniquement les connexions à ces hôtes approuvés (une par ligne)</dt>

**Explanation**
> The option label is displayed in French in the localized product; the English text will not be found on screen.

#### Issue 28 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-settings.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has `AI Features` -> `Fonctionnalités IA` (organization.compliance.ai.section.title); the label differs from the source only by case, yet it was left in English in the last paragraph of `AI Credits`, while the same section is called `Section Fonctionnalités IA` earlier in the topic.
- **Fix** — in the translation, replace `<uicontrol>AI features</uicontrol>` with `<uicontrol>Fonctionnalités IA</uicontrol>`.

**Source**
> <uicontrol>Organization settings</uicontrol> → <uicontrol>AI features</uicontrol>

**Current translation**
> <uicontrol>Paramètres de l'organisation</uicontrol> → <uicontrol>AI features</uicontrol>

**Recommended translation**
> <uicontrol>Paramètres de l'organisation</uicontrol> → <uicontrol>Fonctionnalités IA</uicontrol>

**Explanation**
> The path is half translated; the section title is `Fonctionnalités IA` on screen.

#### Issue 29 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-settings.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has `Organization scheduled for deletion` -> `Organisation programmée pour suppression` (organization.scheduled.for.deletion.title), the displayed section title; it was left in English inside quotation marks.
- **Fix** — in the translation, replace the quoted English title with `«&#160;Organisation programmée pour suppression&#160;»`.

**Source**
> a warning section titled "Organization scheduled for deletion"

**Current translation**
> Une section d'avertissement intitulée «&#160;Organization scheduled for deletion&#160;»

**Recommended translation**
> Une section d'avertissement intitulée «&#160;Organisation programmée pour suppression&#160;»

**Explanation**
> This is a UI message shown on screen in French; a reader looking for the English title will not find it.

#### Issue 32 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-profile-settings.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `User role` -> `Rôle de l'utilisateur` (user.role); the section label in the profile page was rendered `Rôle utilisateur`, a different wording from the localized label (the Members topic correctly uses `Rôle de l'utilisateur`).
- **Fix** — in the translation, replace `Rôle utilisateur` with `Rôle de l'utilisateur`.

**Source**
> <dt>User Role (only available in evaluation versions)</dt>

**Current translation**
> <dt>Rôle utilisateur (disponible uniquement dans les versions d'évaluation)</dt>

**Recommended translation**
> <dt>Rôle de l'utilisateur (disponible uniquement dans les versions d'évaluation)</dt>

**Explanation**
> Field labels must match the localized product exactly so readers can find them; the same label is rendered two ways across the set.

#### Issue 40 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace-conflict-resolution.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has `Keep {destinationBranch} changes` -> `Garder les modifications de {destinationBranch}` and `Keep {sourceBranch} changes`; the labels with branch names (`Keep main changes`, `Keep dev changes`) were left in English, while the sibling labels `Fusion manuelle`, `Conserver les modifications de l'espace de travail` and `Garder les modifications du dépôt` were localized. Also `Merge into current branch` (ui-strings: `Fusionner dans la branche actuelle...`) was left in English in this topic.
- **Fix** — in the translation, use `Garder les modifications de main`, `Garder les modifications de dev` and `Fusionner dans la branche actuelle`.

**Source**
> <uicontrol>Keep main changes</uicontrol> ... <uicontrol>Keep dev changes</uicontrol> ... <uicontrol>Merge into current branch</uicontrol>

**Current translation**
> <uicontrol>Keep main changes</uicontrol> ... <uicontrol>Keep dev changes</uicontrol> ... <uicontrol>Merge into current branch</uicontrol>

**Recommended translation**
> <uicontrol>Garder les modifications de main</uicontrol> ... <uicontrol>Garder les modifications de dev</uicontrol> ... <uicontrol>Fusionner dans la branche actuelle</uicontrol>

**Explanation**
> Three actions of the same dialog are left in English while their siblings are localized; readers will see French labels on screen. Same cause as in `cf-ai-translation-index-conflicts.dita`.

#### Issue 42 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has `Commit changes` -> `Valider les modifications` (commit_changes); the button label differs from the source only by capitalization, yet was left in English (the figure title right below is translated `Validation des modifications`).
- **Fix** — in the translation, replace `Commit Changes` with `Valider les modifications`.

**Source**
> a <uicontrol>Commit Changes</uicontrol> button also appears

**Current translation**
> un bouton <uicontrol>Commit Changes</uicontrol> apparaît également

**Recommended translation**
> un bouton <uicontrol>Valider les modifications</uicontrol> apparaît également

**Explanation**
> The button is displayed as `Valider les modifications` in the localized product.

#### Issue 49 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `Username and access token` -> `Nom d'utilisateur et jeton d'accès`; the source label differs only by capitalization, yet it was left in English while sibling labels (`Nom`, `URL du projet`, `Compte Git`) were localized.
- **Fix** — in the translation, replace `Username and Access Token` with `Nom d'utilisateur et jeton d'accès`.

**Source**
> <uicontrol>Username and Access Token</uicontrol>

**Current translation**
> <uicontrol>Username and Access Token</uicontrol>

**Recommended translation**
> <uicontrol>Nom d'utilisateur et jeton d'accès</uicontrol>

**Explanation**
> The option is displayed in French in the localized product.

#### Issue 52 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-publishing-connectors.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `New connector` -> `Nouveau connecteur`; the source label differs only by capitalization, yet the button was left in English.
- **Fix** — in the translation, replace `New Connector` with `Nouveau connecteur`.

**Source**
> click the <uicontrol>New Connector</uicontrol> button

**Current translation**
> cliquez sur le bouton <uicontrol>New Connector</uicontrol>

**Recommended translation**
> cliquez sur le bouton <uicontrol>Nouveau connecteur</uicontrol>

**Explanation**
> The button is displayed in French in the localized product.

#### Issue 54 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-reviews-search-tab.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `Time` -> `Temps` (the label of the Time filter in the In Reviews tab); the filter label was rendered `Heure` (same wording as in `cf-how-to-find-reviews-where-mentioned.dita`).
- **Fix** — in the translation, replace `Heure` with `Temps`.

**Source**
> <b>Time</b> - The time range for the review.

**Current translation**
> <b>Heure</b> - La période de l'avis.

**Recommended translation**
> <b>Temps</b> - La période de l'avis.

**Explanation**
> The filter names in this list (`Statut`, `Auteur`, `Utilisateur mentionné`) follow the UI strings; `Time` should too.

#### Issue 58 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-reviews-view.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `Time` -> `Temps` (the Time filter label); this topic renders it `Période`, whereas `cf-how-to-find-reviews-where-mentioned.dita` and `cf-reviews-search-tab.dita` render it `Heure`.
- **Fix** — in the translation, use the localized label `Temps` for the filter name (and keep `Toute la période` for the default value).

**Source**
> <b>Time</b> - The time range for the review.

**Current translation**
> <b>Période</b> - La plage de temps de l'avis.

**Recommended translation**
> <b>Temps</b> - La plage de temps de l'avis.

**Explanation**
> Filter names must match what the product displays; the same filter is named three different ways across the set.

#### Issue 61 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/known_issues.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `Forgot your password?` -> `Mot de passe oublié?`; the link name was left in English (source `Forgot Your Password`).
- **Fix** — in the translation, replace `Forgot Your Password` with `Mot de passe oublié`.

**Source**
> use the <uicontrol>Forgot Your Password</uicontrol> link

**Current translation**
> utilisez le lien <uicontrol>Forgot Your Password</uicontrol>

**Recommended translation**
> utilisez le lien <uicontrol>Mot de passe oublié</uicontrol>

**Explanation**
> The link is displayed in French in the localized login page.

#### Issue 65 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/making_changes_to_uploaded_files.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has `Report problem` -> `Signaler un problème` (report_problem); `Report Problem` differs only by capitalization yet stayed in English, while the other entries of the same More menu (`Enregistrer sous`, `Télécharger`, `Choisir le style`, `Préférences`) are localized.
- **Fix** — in the translation, replace `Report Problem` with `Signaler un problème`.

**Source**
> <dt><uicontrol>Report Problem</uicontrol></dt>

**Current translation**
> <dt><uicontrol>Report Problem</uicontrol></dt>

**Recommended translation**
> <dt><uicontrol>Signaler un problème</uicontrol></dt>

**Explanation**
> Same label as in `CF-dita-map-tree-editor.dita` and `known_issues.dita` (where it is translated).

#### Issue 66 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/review-task-header.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — High
- **Root cause** — ui-strings has `Task settings` -> `Paramètres de la tâche`; the label was left in English (lowercase `task settings`) inside a French sentence, whereas the link target page is named `Paramètres de la tâche` elsewhere in the set.
- **Fix** — in the translation, replace `page des <uicontrol>task settings</uicontrol>` with `page <uicontrol>Paramètres de la tâche</uicontrol>`.

**Source**
> the <uicontrol>task settings</uicontrol> page

**Current translation**
> la <xref href="cf-task-settings.dita">page des <uicontrol>task settings</uicontrol></xref>

**Recommended translation**
> la <xref href="cf-task-settings.dita">page <uicontrol>Paramètres de la tâche</uicontrol></xref>

**Explanation**
> The page title is localized, and the English fragment `page des task settings` is also ungrammatical in French.

#### Issue 67 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/user_interface.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Actual error
- **Confidence** — Medium
- **Root cause** — ui-strings has `My Review Tasks` -> `Mes tâches de révision`; the source label `My Review Task` (singular, a source typo) was left in English, although the same list is named `Mes tâches de révision` a few lines below. Also `Log Out` is rendered `Se déconnecter`, whereas ui-strings maps the generic `Log Out` label to `Déconnexion`.
- **Fix** — in the translation, use `Mes tâches de révision` for `My Review Task`, and use `Déconnexion` for the `Log Out` entry if it names the generic menu item (keep `Se déconnecter de {organization}` only for the Cloud per-organization item).

**Source**
> <uicontrol>My Review Task</uicontrol> lists ... <dt>Log Out</dt>

**Current translation**
> <uicontrol>My Review Task</uicontrol> ... <dt>Se déconnecter</dt>

**Recommended translation**
> <uicontrol>Mes tâches de révision</uicontrol> ... <dt>Déconnexion</dt>

**Explanation**
> Labels should match what is displayed: the first was missed because of a typo in the source, the second because two ui-strings rows exist for `Log out`.

### `mixed-language-menu-path`

Menu paths of the Oxygen desktop application mix CF ui-strings translations with English labels that have no ui-strings row.

#### Issue 2 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/topics/reusables-cf-wa-waCustom.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Language improvement
- **Confidence** — Low
- **Root cause** — the Oxygen desktop menu path mixes `Préférences` and `Auteur` (CF ui-strings rows) with untranslated `Editor` and `Edit Modes`.
- **Fix** — in the translation, decide one convention for Oxygen desktop menu paths (all English, as the Oxygen desktop UI is not localized by CF ui-strings) and apply it to every menucascade of this topic.

**Source**
> Options > Preferences > Editor > Edit Modes > Author

**Current translation**
> Options > Préférences > Editor > Edit Modes > Auteur

**Recommended translation**
> Options > Preferences > Editor > Edit Modes > Author (if the desktop UI is shown in English)

**Explanation**
> Labels that exist only in the Oxygen desktop application are not in the CF ui-strings; the `Preferences` and `Author` rows describe CF screens, so the path is a half-translated hybrid readers cannot match on screen.

#### Issue 19 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-git-access-tokens.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Language improvement
- **Confidence** — Medium
- **Root cause** — third-party (GitLab, Bitbucket) menu paths mix CF ui-strings translations (`Préférences`, `Paramètres`, `Sécurité`) with the untranslated third-party labels (`Access tokens`, `Repository settings`).
- **Fix** — in the translation, keep third-party UI labels exactly as in the source (`Preferences`, `Settings`, `Security`) because the CF ui-strings rows do not describe GitLab or Bitbucket screens.

**Source**
> Repository settings > Security > Access tokens

**Current translation**
> Repository settings > Sécurité > Access tokens

**Recommended translation**
> Repository settings > Security > Access tokens

**Explanation**
> The ui-strings file describes the Content Fusion UI only; applying its rows to GitLab/Bitbucket menus produces hybrid paths that match no screen in either language.

#### Issue 62 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/known_issues.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Language improvement
- **Confidence** — Low
- **Root cause** — the Oxygen desktop menu path mixes `Préférences` (translated) with untranslated `Network Connection Settings`, `HTTP(S)/WebDAV`, `Plugins`, `Oxygen Content Fusion Connector` (two paths in the topic).
- **Fix** — in the translation, apply one convention to Oxygen desktop menu paths (keep `Preferences` in English, as for the other desktop labels, or translate all labels consistently with the French Oxygen UI).

**Source**
> Options > Preferences > Network Connection Settings > HTTP(S)/WebDAV

**Current translation**
> Options > Préférences > Network Connection Settings > HTTP(S)/WebDAV

**Recommended translation**
> Options > Preferences > Network Connection Settings > HTTP(S)/WebDAV

**Explanation**
> A half-translated path matches neither the English nor the French Oxygen desktop UI.

#### Issue 74 — UI Terminology

- **File** — `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/browser-compatibility.dita`
- **Category** — UI Terminology
- **Severity** — Minor
- **Issue type** — Language improvement
- **Confidence** — Low
- **Root cause** — the Android settings path mixes a translated first element (`Paramètres`, from the CF ui-strings) with untranslated device labels (`Bandwidth Management`, `Reduce data usage`).
- **Fix** — in the translation, keep device/OS labels exactly as they appear on the device, i.e. `Settings` (or give the French device wording for all three elements).

**Source**
> Settings > Bandwidth Management > Reduce data usage

**Current translation**
> Paramètres > Bandwidth Management > Reduce data usage

**Recommended translation**
> Settings > Bandwidth Management > Reduce data usage

**Explanation**
> The path describes an Android screen that is not governed by the Content Fusion UI strings; a hybrid path matches neither a French nor an English device.

## 4. Coverage table

| # | Target file | Status |
|---|---|---|
| 1 | `DITA-cf/i18n/fusion-cloud/fr-FR/content-fusion.ditamap` | Reviewed — no issues |
| 2 | `DITA-cf/i18n/fusion-cloud/fr-FR/keydefs.ditamap` | Reviewed — no issues |
| 3 | `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/topics/reusables-cf-wa-waCustom.dita` | Reviewed — 2 issues |
| 4 | `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/topics/reusables-cf.dita` | Reviewed — 2 issues |
| 5 | `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/wa-shared/reusables-oxygen-shortcuts-shared.dita` | Reviewed — no issues |
| 6 | `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/wa-shared/reusables-wa-shared.dita` | Reviewed — 1 issue |
| 7 | `DITA-cf/i18n/fusion-cloud/fr-FR/reusables/wa-shared/reusables-webapp-shared.dita` | Reviewed — no issues |
| 8 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/CF-dita-map-tree-editor.dita` | Reviewed — 2 issues |
| 9 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/account_lockout_after_failed_login_attempts.dita` | Reviewed — no issues |
| 10 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/assign_task_to_new_owner.dita` | Reviewed — no issues |
| 11 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-functionality-role.dita` | Reviewed — 1 issue |
| 12 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-positron-overview.dita` | Reviewed — no issues |
| 13 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-asking.dita` | Reviewed — see consistency notes |
| 14 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-custom-doctypes.dita` | Reviewed — no issues |
| 15 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-customizing.dita` | Reviewed — no issues |
| 16 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-data-handling.dita` | Reviewed — 1 issue |
| 17 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-external-agency.dita` | Reviewed — no issues |
| 18 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-first-run.dita` | Reviewed — no issues |
| 19 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-getting-started.dita` | Reviewed — 1 issue |
| 20 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-importing-existing.dita` | Reviewed — no issues |
| 21 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-index-conflicts.dita` | Reviewed — 1 issue |
| 22 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-index-format.dita` | Reviewed — no issues |
| 23 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-index.dita` | Reviewed — no issues |
| 24 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-jobs.dita` | Reviewed — 1 issue |
| 25 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-project-structure.dita` | Reviewed — no issues |
| 26 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-redoing.dita` | Reviewed — no issues |
| 27 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-reviewing.dita` | Reviewed — see consistency notes |
| 28 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-running.dita` | Reviewed — 1 issue + consistency notes |
| 29 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation-terminology.dita` | Reviewed — see consistency notes |
| 30 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-ai-translation.dita` | Reviewed — 1 issue + consistency notes |
| 31 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-amazon-s3-connector.dita` | Reviewed — 1 issue |
| 32 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-buy-organization-subscription.dita` | Reviewed — no issues |
| 33 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-closing-tasks.dita` | Reviewed — 1 issue |
| 34 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-commenting-suggesting-role.dita` | Reviewed — 1 issue |
| 35 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-communicating-authors-role.dita` | Reviewed — no issues |
| 36 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-component-media-tab.dita` | Reviewed — no issues |
| 37 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-components-tab.dita` | Reviewed — no issues |
| 38 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-concurrent-editing.dita` | Reviewed — 1 issue |
| 39 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-content-search-tab.dita` | Reviewed — no issues |
| 40 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-creating-review-tasks-role.dita` | Reviewed — 1 issue + consistency notes |
| 41 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-deliverables-role.dita` | Reviewed — see consistency notes |
| 42 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-getting-started-accessing-cloud.dita` | Reviewed — no issues |
| 43 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-getting-started-create-organization.dita` | Reviewed — no issues |
| 44 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-getting-started-forgot-password.dita` | Reviewed — 1 issue |
| 45 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-getting-started-log-out.dita` | Reviewed — no issues |
| 46 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-getting-started-login-organization.dita` | Reviewed — no issues |
| 47 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-getting-started-profile-page.dita` | Reviewed — no issues |
| 48 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-getting-started-quick-start.dita` | Reviewed — no issues |
| 49 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-getting-started-signup-organization.dita` | Reviewed — no issues |
| 50 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-getting-started-system-requirements.dita` | Reviewed — no issues |
| 51 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-git-access-tokens.dita` | Reviewed — 3 issues |
| 52 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-how-to-find-reviews-where-mentioned.dita` | Reviewed — 1 issue |
| 53 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-integrating-review-tasks.dita` | Reviewed — no issues |
| 54 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-invite-members.dita` | Reviewed — no issues |
| 55 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-keys-tab.dita` | Reviewed — no issues |
| 56 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-known-issues-git.dita` | Reviewed — 2 issues |
| 57 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-manage-paid-subscription.dita` | Reviewed — 1 issue |
| 58 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-netlify-connector.dita` | Reviewed — see consistency notes |
| 59 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-new-task-from-interface.dita` | Reviewed — 2 issues |
| 60 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-new-task.dita` | Reviewed — no issues |
| 61 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-authentication.dita` | Reviewed — no issues |
| 62 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-members.dita` | Reviewed — 1 issue |
| 63 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-projects.dita` | Reviewed — no issues |
| 64 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-security.dita` | Reviewed — 1 issue |
| 65 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-settings.dita` | Reviewed — 3 issues |
| 66 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-subscription-statuses.dita` | Reviewed — no issues |
| 67 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organization-subscription.dita` | Reviewed — 1 issue |
| 68 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-organizations-management.dita` | Reviewed — see consistency notes |
| 69 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-personal-workspace-role.dita` | Reviewed — no issues |
| 70 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-profile-settings.dita` | Reviewed — 1 issue |
| 71 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-project-review-tasks-role.dita` | Reviewed — no issues |
| 72 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-project-settings-members-role.dita` | Reviewed — no issues |
| 73 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-deliverables.dita` | Reviewed — no issues |
| 74 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-members.dita` | Reviewed — no issues |
| 75 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-overview-role.dita` | Reviewed — no issues |
| 76 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-publications.dita` | Reviewed — 1 issue |
| 77 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-publishing-execution-status.dita` | Reviewed — no issues |
| 78 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-publishing-metrics.dita` | Reviewed — no issues |
| 79 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-repository.dita` | Reviewed — no issues |
| 80 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-review-tasks.dita` | Reviewed — 3 issues + consistency notes |
| 81 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-settings.dita` | Reviewed — no issues |
| 82 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace-conflict-resolution.dita` | Reviewed — 1 issue + consistency notes |
| 83 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace.dita` | Reviewed — 2 issues |
| 84 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_changes_view.dita` | Reviewed — 1 issue |
| 85 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_files_view.dita` | Reviewed — 1 issue |
| 86 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_incoming_changes.dita` | Reviewed — no issues |
| 87 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_problems_view.dita` | Reviewed — no issues |
| 88 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_publications_view.dita` | Reviewed — 2 issues |
| 89 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_search_view.dita` | Reviewed — see consistency notes |
| 90 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects-workspace_translation_jobs_view.dita` | Reviewed — see consistency notes |
| 91 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-projects.dita` | Reviewed — 3 issues |
| 92 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-publications-role.dita` | Reviewed — 1 issue |
| 93 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-publishing-connectors.dita` | Reviewed — 1 issue |
| 94 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-renew-organization-subscription.dita` | Reviewed — 1 issue |
| 95 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-review-task-comment-mentions-notifications.dita` | Reviewed — see consistency notes |
| 96 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-review-tasks-overview-role.dita` | Reviewed — no issues |
| 97 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-reviewing-content-role.dita` | Reviewed — no issues |
| 98 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-reviews-search-tab.dita` | Reviewed — 1 issue + consistency notes |
| 99 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-roles-organization.dita` | Reviewed — no issues |
| 100 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-roles-project.dita` | Reviewed — no issues |
| 101 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-roles-review-task.dita` | Reviewed — no issues |
| 102 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-roles-user.dita` | Reviewed — no issues |
| 103 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-search-syntax-dita.dita` | Reviewed — 1 issue |
| 104 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-sftp-connector.dita` | Reviewed — no issues |
| 105 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-stop-subscription-auto-renewal.dita` | Reviewed — no issues |
| 106 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-subscription-expiration-impact.dita` | Reviewed — no issues |
| 107 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-activity.dita` | Reviewed — no issues |
| 108 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-ai-positron.dita` | Reviewed — no issues |
| 109 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-dashboard.dita` | Reviewed — 1 issue |
| 110 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-files.dita` | Reviewed — 1 issue |
| 111 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-reviews-view.dita` | Reviewed — 1 issue + consistency notes |
| 112 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-search.dita` | Reviewed — see consistency notes |
| 113 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-settings.dita` | Reviewed — no issues |
| 114 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-task-status.dita` | Reviewed — see consistency notes |
| 115 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-unlocking-files.dita` | Reviewed — 1 issue |
| 116 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-upgrade-organization-subscription.dita` | Reviewed — no issues |
| 117 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-work-as-author.dita` | Reviewed — no issues |
| 118 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cf-work-as-subject-matter-expert.dita` | Reviewed — see consistency notes |
| 119 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/cfdocs-output-hosting.dita` | Reviewed — no issues |
| 120 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/content_fusion_key_concepts.dita` | Reviewed — no issues |
| 121 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/content_fusion_task_details.dita` | Reviewed — no issues |
| 122 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/deleting_tasks.dita` | Reviewed — no issues |
| 123 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/finishing_tasks.dita` | Reviewed — no issues |
| 124 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/getting_started.dita` | Reviewed — no issues |
| 125 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/known_issues.dita` | Reviewed — 4 issues + consistency notes |
| 126 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/making_changes_to_uploaded_files.dita` | Reviewed — 2 issues + consistency notes |
| 127 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/overview.dita` | Reviewed — no issues |
| 128 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/review-task-header.dita` | Reviewed — 1 issue |
| 129 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/review-tasks-intro.dita` | Reviewed — no issues |
| 130 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/roles_in_content_fusion.dita` | Reviewed — no issues |
| 131 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/sharing_tasks_with_reviewers.dita` | Reviewed — no issues |
| 132 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/types_of_review_tasks.dita` | Reviewed — no issues |
| 133 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/user_interface.dita` | Reviewed — 2 issues |
| 134 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/WA-dita-map-doc-type.dita` | Reviewed — 1 issue |
| 135 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/WA-dita-topic-doc-type.dita` | Reviewed — 4 issues |
| 136 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/browser-compatibility.dita` | Reviewed — 1 issue |
| 137 | `DITA-cf/i18n/fusion-cloud/fr-FR/topics/wa-shared/content-fusion_vs_web-author.dita` | Reviewed — 1 issue |
