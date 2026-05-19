---
name: Sections-to-Topics Refactoring — Instructions
description: Use this when you have a task to extract sections from a topic as separate topics.
---

# Sections-to-Topics Refactoring — Instructions

## What This Task Is

Some add-on topics in this project are structured as a single DITA topic with multiple top-level `<section>` elements inside `<body>`. The goal of this task is to extract each `<section>` into its own standalone `.dita` file, making the original topic the parent and the extracted sections its children in the ditamap.

This is a **structural refactoring only** — no content, text, attributes, or element IDs may be changed, added, or removed, except where mechanically required (see rules below).

---

## Project Paths

- **Add-ons topic files**: `DITA-addons/add-ons/`
- **Ditamap**: `DITA-addons/add-ons.ditamap`
- **Reference example (already completed)**: `DITA-addons/add-ons/batch-converter-addon.dita` and its 6 child topics

---

## Transformation Rules

### 1. Identify sections
Look for `<section>` elements that are **direct children of `<body>`** in the topic. These are the candidates for extraction.

### 2. Parent topic
The original topic file is kept and becomes the parent. Its content after transformation:
- `<title>` — unchanged
- `<shortdesc>` — unchanged (if present)
- `<prolog>` — unchanged (if present)
- `<body>` — keep only content that appears **before the first `<section>`**. Remove all `<section>` elements. If there is no pre-section body content, the `<body>` element can be omitted entirely or left empty.

### 3. Child topics
Each `<section>` becomes a new standalone `.dita` file:
- **DOCTYPE**: `<!DOCTYPE topic PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">`
- **Root element**: `<topic id="...">`
- **`<title>`**: taken from the section's `<title>` element
- **`<body>`**: contains all content from inside the `<section>`, **excluding** the `<title>` element (which becomes the topic title)
- The `<section>` wrapper element itself is **dropped** — its children go directly into `<body>`

### 4. File naming
- Pattern: `{parent-topic-id}-{slugified-section-title}.dita`
- Slugify = lowercase, spaces replaced with hyphens, special characters removed
- Examples:
  - Section "Quick Installation" in `batch-converter-addon.dita` → `batch-converter-addon-quick-installation.dita`
  - Section "Word to DITA Conversion Notes" → `batch-converter-addon-word-to-dita-notes.dita`

### 5. Topic IDs
- The topic `id` attribute = filename without `.dita`
- Example: file `batch-converter-addon-quick-installation.dita` → `id="batch-converter-addon-quick-installation"`
- The old section `id` attribute is **dropped** (it was on `<section>`, which no longer exists)

### 6. Cross-reference fixup (the one allowed content change)
If any `<xref href="...">` in the document uses the pattern `#topicid/elementid` to reference an element that was inside a section that has now moved to a different file, the href must be updated to:
```
filename.dita#new-topic-id/elementid
```
The link text and the target `elementid` are **never changed** — only the file path and topic ID prefix in the href.

### 7. Ditamap update
After creating the child topic files, add them to `add-ons.ditamap` as children of the parent topicref, in the same order as the sections appeared in the original file. Use the `add_dita_reference_to_ditamap` tool.

### 8. Validation
Every saved file must validate without errors. Fix any validation errors before moving on.

### 9. Mandatory content verification output
After completing the refactoring, you **must** produce a verification table for the user. This is not optional. The table must show, for every piece of content in the original file, exactly where it ended up. The user needs to be able to *see* that nothing was changed — not just be told.

The format is:

```
## Content Verification

### Parent topic: `{filename}.dita`
| Original location | Destination file | Element IDs preserved | Notes |
|---|---|---|---|
| `<title>` | `{filename}.dita` | — | Unchanged |
| `<shortdesc>` | `{filename}.dita` | — | Unchanged |
| `<prolog>` | `{filename}.dita` | — | Unchanged |
| Body content before first section (e.g. `<p id="p_xyz">`) | `{filename}.dita` | ✅ `p_xyz` | Unchanged |
| Section: "Quick Installation" | `{filename}-quick-installation.dita` | ✅ all IDs | Section wrapper dropped, title promoted |
| Section: "Manual Installation" | `{filename}-manual-installation.dita` | ✅ all IDs | Section wrapper dropped, title promoted |
...

### Changed references (xref fixups)
| Original href | Updated href | Reason |
|---|---|---|
| `#topicid/elementid` | `other-file.dita#other-topic/elementid` | Target moved to separate file |

### Structural changes only (nothing else)
- `<section>` wrapper elements: removed (replaced by topic file structure)
- Section `id` attributes (`section_abc`, etc.): dropped
- All other element IDs, attributes, and text content: **identical to original**
```

If there were no xref fixups needed, say so explicitly in that section. List every section by name — do not summarize with "etc." or "and so on".

Save the verification output as a Markdown file in the `logs/` subfolder next to these instructions:
- Path: `DITA/positron-ai-actions/docs/addons-ai/sections-topics/logs/`
- Filename: `{parent-topic-id}-verification-{n}.md` where `{n}` is the pass number (1, 2, 3…)
- Each run — whether it's the initial refactoring or a subsequent QA pass — gets its own numbered file
- Examples: `batch-converter-addon-verification-1.md`, `batch-converter-addon-verification-2.md`
- Do not overwrite a previous log; always increment the number

Also update `progress.md` to mark the topic as ✅ Done.

---

## Before/After Pattern

**Before** (inside the original topic's `<body>`):
```xml
<body>
  <p id="p_intro">Intro paragraph.</p>
  <section id="section_abc">
    <title>Quick Installation</title>
    <p id="p_xyz">Install content here.</p>
  </section>
  <section id="section_def">
    <title>Manual Installation</title>
    <ol id="ol_123">...</ol>
  </section>
</body>
```

**After** — parent topic `<body>`:
```xml
<body>
  <p id="p_intro">Intro paragraph.</p>
</body>
```

**After** — child topic file `{parent-id}-quick-installation.dita`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">
<topic id="{parent-id}-quick-installation">
  <title>Quick Installation</title>
  <body>
    <p id="p_xyz">Install content here.</p>
  </body>
</topic>
```

Note: the `<section>` wrapper and its `id` are gone. The section's `<title>` becomes the topic `<title>`. Everything else is preserved verbatim.

---

## Candidate Discovery

If the user asks you to find candidates, scan the `DITA-addons/add-ons/` directory for `.dita` files that:
1. Appear as **leaf topicrefs** in `add-ons.ditamap` (no child topicrefs)
2. Contain one or more `<section>` elements as direct children of `<body>`

Report the candidates with their section count and section titles. Do not proceed with the refactoring unless the user confirms which topic(s) to process.

If the user names a specific topic, go straight to work on that topic without asking for confirmation.

---

## Reference Example

`batch-converter-addon.dita` has been fully processed. Its 6 child topics are:

| File | Section title |
|---|---|
| `batch-converter-addon-quick-installation.dita` | Quick Installation |
| `batch-converter-addon-manual-installation.dita` | Manual Installation |
| `batch-converter-addon-details.dita` | Batch Documents Converter Details |
| `batch-converter-addon-configuration.dita` | Configuration |
| `batch-converter-addon-word-to-dita-notes.dita` | Word to DITA Conversion Notes |
| `batch-converter-addon-resources.dita` | Resources |

Study these files if you need to verify the expected output structure.
