# Additional instructions

These instructions keep the translated user guide consistent with the localized product. Readers look on
screen for the labels the documentation names, so every UI label must match the localized product exactly.

The terminology gives each concept one translation, so readers recognize it as the same thing in every topic.

## Products

Each product has its own language resources, in `.contentfusion/i18n/<product>/terminology/`.
The translation request names the product. Find its `<product>` folder in this table:

| Product | `<product>` | Language resources |
|---|---|---|
| Content Fusion | `fusion` | `.contentfusion/i18n/fusion/terminology/` |

If the request does not name a product, or names one that is not in the table, stop before
translating anything and ask the user which product the publication documents.

## Language resources for UI Strings and Terminology

Each target language has two resource files in the product's folder,
`.contentfusion/i18n/<product>/terminology/` (see *Products*).
Derive their names from the target language's BCP 47 tag (`<lang>`, e.g. `fr-FR`):

| File | Name | Example for `fr-FR` | Holds |
|---|---|---|---|
| Terminology | `terminology.en-US-<lang>.md` | `terminology.en-US-fr-FR.md` | Terminology terms and do-not-translate terms |
| UI strings | `ui-strings.<lang with _>.md` | `ui-strings.fr_FR.md` | The product's translated UI labels and messages |

If a file does not exist for the target language, skip the steps that use it.

## UI strings

**UI strings** are the exact text shown on screen: menus, options, buttons, view and dialog names, messages.

**UI strings file**

The file has a table with the columns `ID` | `Source` | `Target` | `Context` (the headers also name the
language, e.g. `Source (en-US)`). The same `Source` can appear in several rows with different IDs; `Context`
tells where each one is shown.

| Column | Meaning |
|---|---|
| ID | The string's key in the product. Use it only to tell rows apart; never put it in the translation. |
| Source | The text in the source language, exactly as the product shows it. |
| Target | The text the localized product shows for that string. |
| Context | Where the string is shown (button, menu, dialog, message). |

## Terminology

**Terminology** is binding: it overrides your own wording preferences or any
translation memory-like intuition. It fixes which word to use for a concept; the
surface form (number, gender, articles, agreement) adapts to the sentence.

**Terminology file**

Sections:
1. `Do not translate`: columns `Term` | `Kind` | `Note`. `Kind` is one of `code`,
   `product`, `brand`, `name`, `acronym`, `other`. `Note` says what the term
   names and how it behaves in the target language (gender, plural, compounds).
2. `Terms`: columns `Source` | `Target` | `Context` | `Details`.

Columns of the `Terms` table:

| Field | Meaning |
|---|---|
| Source | The source term in lemma form (singular noun, infinitive verb). It matches every inflected form in the text. |
| Target | The translation to use. |
| Context | What the term means in this row. Use it to choose between rows with the same Source. |
| Details | `key: value` pairs separated by `;`. They describe the Target. Keys are listed below. |

In any cell, `\|` stands for `|` and `\;` stands for `;`.

Keys in the Details column:

| Key | Meaning | Values |
|---|---|---|
| `pos` | Part of speech of the Source term. Use it to choose the right row: "map" as a noun and "map" as a verb are separate rows. | `noun`, `verb`, `adj`, `adv`, `phrase`, `name` |
| `gender` | Grammatical gender of the Target. Articles, adjectives, pronouns and past participles must agree with it. | `m` masculine, `f` feminine, `n` neuter, `c` common |
| `number` | The Target is restricted in number. | `sg` singular only, `pl` plural only (verbs and adjectives agree in the plural), `inv` same form in singular and plural |
| `admitted` | An acceptable alternative to the Target. Use it only when the condition in parentheses holds. With no condition, prefer the Target and use the alternative only where the Target reads wrong. A gender in parentheses belongs to the alternative. | term, optional `(gender)`, optional `(condition)` |
| `deprecated` | An outdated translation. Do not produce it. When you update a stale resource, replace it in the unchanged sections too; this overrides keeping the existing translation's wording. | term |
| `forbidden` | A translation that must never appear in the output, even if it sounds natural, and even inside a longer phrase. Often a false friend or a competitor's term. | term |
| `ctx` | Special handling of the term. | `code` literal token: copy unchanged, like a `Do not translate` entry; `title` the term often appears in titles and headings: there, capitalize the Target as the `case` key says, not as the English title does |
| `case` | Capitalization of the Target. | `keep` keep it as written everywhere; `sentence` capitalize only the first word; `title` capitalize the main words |
| `abbr` | Abbreviated form of the Target. Use it where the source uses an abbreviation. | term |
| `ex` | An example: `source → target`. Follow its inflection and word order. | sentence pair |
| `id` | Concept identifier, used for maintenance. Ignore it when translating. | `c-` + digits |
| `note` | Extra guidance for this term. Follow it. | text |



## Workflow

Do these three passes before you write any translation.

**Pass 1: Detect UI string and term candidates.**

Scan the full text content of every resource in the batch, including translatable
attributes, and collect two kinds of candidates, each distinct candidate once. The
element lists below are indicative, not exhaustive: use your DITA knowledge to
classify any other element of the same nature, such as a specialization of a
listed element.

1. **UI strings**: the text of a UI element. UI elements are:
   - `uicontrol`, `wintitle`, `msgph` and `systemoutput`;
   - each `uicontrol` of a `menucascade`, taken separately.

   Collect the whole text of the element as one candidate; do not split it into
   words.
2. **Terms:** everything outside UI elements. A term is a term whether or not it
   carries markup, so plain prose counts. Collect the words and phrases that
   name product or domain concepts, keeping multi-word phrases whole (see
   Pass 2). Include everyday technical words that the target language often
   leaves in English, such as *workflow*.

   Terms are often wrapped in markup, for example:
   - terminology/glossary: term, abbreviated-form, keyword, glossterm,
     glossSurfaceForm, glossAbbreviation, glossAcronym, glossSynonym, glossAlt
   - software/programming: option, parmname, apiname, userinput, coderph
   - generic/inline containers: ph, indexterm, index-see

**Pass 2: Look up every candidate.**

Look up each Pass 1 candidate in its own file: UI strings in the UI strings
file, terms in the terminology file. Pass 3 applies the matches.

*File access*
The resource files might be very large; reading them would crowd your
context. Look entries up with the `Grep` tool instead, reading only the
matching lines.

*UI strings*
- Match the whole text of the UI element, as collected in Pass 1, against the
  whole `Source` cell (second column), not anywhere in the line. Ignore case:
  "Report Problem" matches `Report problem` (Grep with `-i`).
- Ignore a trailing `...`, `…`, `:` or `?` on either side: "Merge into current
  branch" matches `Merge into current branch...`.
- A placeholder such as `{0}` or `{destinationBranch}` in the `Source` cell
  matches any value: "Keep main changes" matches `Keep {destinationBranch} changes`.
- When several rows share the `Source` with different Targets, pick the row
  whose `Context` fits the element and the surrounding text (button, menu,
  dialog). If `Context` does not settle it, use the first matching row, and use
  the same row for every occurrence in the batch.

*Terms*
- Match against the whole first cell of each row: `Term` in `Do not translate`,
  `Source` in `Terms`. Some `Do not translate` terms are wrapped in backticks.
- Search by lemma form (see `Source`), without surrounding punctuation.
- Try the longest phrase first: "transformation scenario" wins over "scenario".
  If the phrase has no match, drop words from either end and look up the
  shorter phrases it contains: "translation status report" → "translation status".
- A term with no match at any length is translated normally.

**Pass 3: Translate the batch.**

Apply every Pass 2 match to every occurrence in the batch, in element content and in translatable attributes.

*UI strings*
- Copy the Target exactly: no inflection, no capitalization changes, no added
  quotation marks or brackets.
- If the sentence needs a grammatical form the label does not have, add a noun
  such as button, menu, view or dialog box in the target language instead of
  changing the label *(French example; the pattern applies to every language)*:

  | Wrong (label inflected) | Correct (label unchanged) |
  |---|---|
  | Ouvrez les Paramètres. | Ouvrez la vue **Paramètres**. |
  | Cliquez sur l'Enregistrement. | Cliquez sur le bouton **Enregistrer**. |
  | Les options des Préférences | Les options de la section **Préférences** |

- Placeholders such as `{0}` and `{$lock.owner}` are filled in at runtime. Use
  the Target with the source text's value or description in place of the
  placeholder: "Due date: May 5" → "Date d'échéance : 5 mai", never
  "Date d'échéance : {0}".
- A trailing `...`, `…`, `:` or `?` follows the source text, not the row: add
  it after the Target if the source text has it, drop it if it does not.
- If a label has no match, keep the English label; do not guess a translation.

*Terms*
- Apply every key in the row's `Details` (see *Keys in the Details column*).
- Use the Target and adapt its surface form to the sentence (number, gender,
  articles, contractions, agreement, syntactic integration).
- Keep the Target even where a synonym seems more natural or its listed form
  fits awkwardly; rephrase around it. The only alternatives allowed are its
  `admitted` values.

  Sample for `validation scenario` → `scénario de validation` *(French example)*:

  | Form | Example |
  |---|---|
  | un scénario de validation | Créez un nouveau scénario de validation. |
  | le scénario de validation | Sélectionnez le scénario de validation approprié. |
  | du scénario de validation | Modifiez le nom du scénario de validation. |

- Capitalization follows the case of the source occurrence, unless a `case`
  key says otherwise or the term's position in the target sentence requires a
  capital.

*Do not translate*
- Copy the entry as it is written in the source text, untranslated.
- Keep its capitalization even where target conventions would change it
  (sentence-case headings, sentence start); build the sentence around it.
- Follow its Note (gender, plural, compounds).
  For `DITA map`, Note "feminine in French (la DITA map)" *(French example)*:
  "Ouvrez la DITA map dans l'éditeur.", not "carte DITA".
