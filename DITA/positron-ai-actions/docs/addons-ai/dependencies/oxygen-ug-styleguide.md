# Oxygen XML Editor — User Guide Style Guide

**Version 1.0 | May 2026**

---

## 1. Voice and Tone

### Who We Are Writing For
Our audience consists of technical users: developers, XML authors, and content creators who use Oxygen XML Editor to build and publish documentation. They are intelligent, time-pressed, and goal-oriented. They read to *do*, not to browse.

### Our Voice
The Oxygen User Guide voice is:

- **Direct and instructional.** Tell users what to do, not what the software "allows" them to do. Prefer *"Select the file"* over *"You can select the file."*
- **Professional but approachable.** Formal enough to be credible; plain enough to be understood. Avoid jargon, buzzwords, and overly academic language.
- **Precise and unambiguous.** Every sentence should have exactly one interpretation. If a pronoun could refer to more than one thing, rewrite the sentence.
- **Neutral and factual.** Avoid marketing language, superlatives, and subjective claims (*"powerful," "easy," "seamlessly"*).

### Tone Dos and Don'ts

| ✅ Do | ❌ Don't |
|---|---|
| Use active voice | Use passive voice |
| Use second person ("you") | Use first person plural ("we") in procedures |
| Use present tense | Use future tense unnecessarily |
| Use plain, common words | Use fancy or pretentious vocabulary |
| Be concise | Add filler words or redundant phrases |
| Use contractions only in notes/tips | Use contractions in formal procedural text |

---

## 2. Language and Grammar

### Active Voice
Write in the active voice. Passive voice obscures who performs an action and weakens clarity.

- ❌ *"The file is opened by the editor."*
- ✅ *"The editor opens the file."*

### Tense
Use the **simple present tense** for describing UI behavior and procedures.

- ❌ *"Clicking the button will open the dialog box."*
- ✅ *"Clicking the button opens the dialog box."*

### Second Person
Address the reader directly as **"you."** Avoid "the user" when you mean the person reading the doc.

- ❌ *"The user can configure the settings."*
- ✅ *"You can configure the settings."*

### Contractions
Avoid contractions in formal procedural content. They are acceptable in notes, tips, and conversational callouts.

### Redundancy
Cut words that add length without adding meaning.

| Redundant | Preferred |
|---|---|
| in order to | to |
| end result | result |
| variety of different | variety of |
| still remains | remains |
| add an additional | add |
| during the course of | during |

### Pronouns
Be specific. Vague pronouns (*"this," "it," "these"*) cause confusion. Replace them with the noun they refer to.

- ❌ *"This allows you to configure it."*
- ✅ *"This option allows you to configure the output path."*

### Spelling
Use **American English** spelling throughout (e.g., *"color"* not *"colour"*, *"customize"* not *"customise"*).

---

## 3. Formatting and Structure

### Titles and Headings
Follow title case rules:
- Capitalize the first word, all nouns, all verbs, and all words of four or more letters (except prepositions *from, like, into, over, with* and conjunction *that*).
- Do not capitalize articles (*a, an, the*), short prepositions (*in, of, to, by, at, for*), or short conjunctions (*and, but, or, nor*).
- Use `<codeph>` tags (not capitalization) for element and attribute names in titles.

### Sentences and Paragraphs
- Keep sentences short — one idea per sentence.
- Keep paragraphs short — group sentences around a single idea.
- Do not start consecutive sentences with the same word.
- Avoid run-on sentences. When in doubt, split.

### Lists
- Use **ordered lists** (`<ol>`) for sequential steps.
- Use **unordered lists** (`<ul>`) for non-sequential items.
- Use **definition lists** (`<dl>`) for options, settings, and UI controls.
- End each list item with a period. Be consistent within a list.
- Do not use semicolons at the end of list items.
- Avoid nesting more than two levels deep.

### Notes and Callouts
Use notes sparingly and purposefully:
- **Note** — supplementary information the reader should be aware of.
- **Tip** — a helpful shortcut or best practice.
- **Important/Warning** — information that could cause data loss or unexpected behavior.
- Avoid placing two notes of the same type consecutively.

### Procedures (Step-by-Step Instructions)
- Use a title for procedures embedded in long topics.
- Each step should describe a single action.
- Put informational content *after* the action within a step, or outside the step entirely.
- Mark optional steps explicitly: *(Optional)* at the start of the step.
- Use conditional language for branching steps: *"If … then …"*

---

## 4. UI Elements and Markup

### UI Controls
Wrap all UI element names in `<uicontrol>` tags: buttons, menus, dialog boxes, views, modes, and actions.

- ✅ *"Click the **Send** button."* → `<uicontrol>Send</uicontrol>`
- ✅ *"Open the **AI Positron** side view."* → `<uicontrol>AI Positron</uicontrol>`

Only wrap names in `<uicontrol>` when referring to a specific UI element.
- ❌ "The <uicontrol>Git Client</uicontrol> lets you customize <uicontrol>AI</uicontrol> integration preferences."
- ✅ "Customize Git Client preferences on 
  <menucascade><uicontrol>Plugins</uicontrol>
  <uicontrol>Git Client</uicontrol>
  <uicontrol>AI</uicontrol></menucascade>"

For menu paths, use `<menucascade>`:
```xml
<menucascade>
  <uicontrol>Window</uicontrol>
  <uicontrol>Show View</uicontrol>
</menucascade>
```

### Code and Technical Terms
- Use `<codeph>` for inline code, element names, attribute names, and file extensions.
- Use `<codeblock>` for multi-line code samples.
- Use `<filepath>` for file names and paths.
- Use `<shortcut>` for keyboard shortcuts.
- Use `<term>` for glossary terms and technical concepts introduced for the first time.

### Icons
When documenting a toolbar or menu action that has an icon:
- Include the icon image *before* the action name, inside the same `<uicontrol>` element.
- Do not add a space between the icon and the name.

### Product Names
Use the correct capitalization for all product and company names as defined by the brand owner. Use key references (`<ph keyref="product"/>`) for the Oxygen product name to support multi-product publishing.

---

## 5. Links and Cross-References

- Link generously. If a term, option, or concept is described elsewhere, link to it.
- Use descriptive link text — never *"click here"* or *"see this."*
  - ❌ *"For more information, click [here]."*
  - ✅ *"For more information, see [AI Positron View]."*
- For external URLs, always set `format="html" scope="external"`.
- Link to related topics using `<related-links>` at the end of a topic.

---

## 6. Topic Structure and Content Design

### One Topic, One Idea
Each topic covers a single subject. It must be self-contained — a reader who lands on it from a search should not need to read another topic first to understand it.

### Required Topic Elements
| Element | Requirement |
|---|---|
| `<title>` | Required. Descriptive, title-cased. |
| `<shortdesc>` | Strongly recommended. One or two sentences summarizing the topic. |
| `<prolog>` with `<indexterm>` | Required for discoverability. |
| `<body>` | Required. |

### Images
- Include images only when they add meaningful context (not for self-explanatory UI).
- Always wrap images in a `<fig>` element with a `<title>`.
- Maximum image size: 650 × 650 pixels. Use PNG format with a white background.
- For complex UI screenshots, consider using an image map (`<imagemap>`) with clickable areas linked to relevant sections.

### Sections
Use `<section>` elements to divide long topics into scannable chunks. Each section must have a descriptive title. Sections help readers jump directly to the information they need.

---

## 7. Best Practices Checklist

Before submitting or publishing a topic, verify the following:

- [ ] Topic has a clear, descriptive title in title case.
- [ ] `<shortdesc>` is present and summarizes the topic in 1–2 sentences.
- [ ] Active voice is used throughout.
- [ ] No contractions in formal procedural text.
- [ ] All UI element names are wrapped in `<uicontrol>`.
- [ ] Code, file names, and attributes use `<codeph>` or `<filepath>`.
- [ ] Ordered lists are used for sequential steps; unordered for non-sequential items.
- [ ] Links use descriptive anchor text (no "click here").
- [ ] No redundant phrases or unnecessary adverbs.
- [ ] American English spelling is used.
- [ ] Images are in `<fig>` elements with titles and do not exceed 650px.
- [ ] Notes are used sparingly and purposefully.
- [ ] Index terms are included in `<prolog><metadata><keywords>`.
- [ ] Topic is self-contained and makes sense as a standalone search result.
- [ ] Content has been proofread — ideally by a second reviewer.

---

*This style guide is informed by the Oxygen XML Editor internal documentation rules and aligns with widely adopted technical writing standards, including the [Google Developer Documentation Style Guide](https://developers.google.com/style) and the [Microsoft Writing Style Guide](https://learn.microsoft.com/en-us/style-guide/welcome/).*
