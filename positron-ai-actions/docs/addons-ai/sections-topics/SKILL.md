---
name: Sections-to-Topics Refactoring — Instructions
description: Use this when you need to extract direct child sections from a DITA topic into separate child topics while preserving content.
---

# Sections-to-Topics Refactoring — Instructions

## Purpose

Use this skill to split a DITA topic that contains several top-level `<section>` elements into a parent topic and separate child topic files. This is useful when a long topic needs better navigation, reuse, or maintenance.

The refactoring is structural only. Do not rewrite, summarize, reword, reorder, or remove source content. Change only what is required to make the extracted content valid as standalone DITA topics and to keep links working.

## Inputs To Infer Or Confirm

Before you start, identify these values from the user request, current document, current DITA map, or project context:

- **Source topic**: The `.dita` file that contains the sections.
- **Target folder**: Usually the same folder as the source topic, unless the user gives a different location.
- **DITA map**: The map that contains the source topic reference.
- **Parent topicref**: The topic reference that points to the source topic.
- **Extraction scope**: Usually only `<section>` elements that are direct children of the topic body.

If the user asks to process add-on documentation and does not provide paths, use these project defaults:

- **Add-ons topic folder**: `DITA-addons/add-ons/`
- **Add-ons DITA map**: `DITA-addons/add-ons.ditamap`

If the source topic is named explicitly, proceed with that topic. If the user asks for candidates, report the candidates and wait for confirmation before changing files.

## Candidate Discovery

When asked to find candidates, scan the relevant topic folder and map for `.dita` files that:

1. Appear in the DITA map as leaf topicrefs, or as topicrefs that would benefit from child topics.
2. Contain one or more `<section>` elements as direct children of the topic body.

Report each candidate with:

- Topic file.
- Number of direct child sections.
- Section titles.
- Any reason to skip or review manually, such as only one section, unusual nested structure, existing child topics, or many cross-references.

Do not refactor candidate topics until the user confirms which topic or topics to process.

## Transformation Rules

### 1. Identify The Sections To Extract

Extract only `<section>` elements that are direct children of the body element of the source topic:

- For a base topic, inspect `<topic>/<body>/<section>`.
- For a concept, inspect `<concept>/<conbody>/<section>`.
- For a reference, inspect `<reference>/<refbody>/<section>`.
- For a task, do not extract sections unless the structure is valid and the user explicitly asked for it.

Do not extract nested sections unless the user explicitly asks for a deeper split.

### 2. Keep The Source Topic As The Parent

The original topic file remains in place and becomes the parent topic. Preserve the root element, topic ID, title, short description, prolog, metadata, attributes, and any content that appears before the first extracted section.

Remove the extracted top-level `<section>` elements from the parent. If the body has no remaining content, keep or omit the body according to the topic type and project style, but keep the file valid.

### 3. Create One Child Topic For Each Extracted Section

Create one standalone `.dita` file for each extracted section.

Use a base DITA topic unless the project or user requests a specialized topic type:

- DOCTYPE: `<!DOCTYPE topic PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">`
- Root element: `<topic id="...">`
- Topic title: the extracted section's `<title>` content.
- Topic body: all content from the extracted section except the section `<title>`.

Drop the `<section>` wrapper. Its children become direct children of the new topic body.

Preserve all child elements, IDs, attributes, text, processing instructions, comments, and entity references unless a validation fix is required.

### 4. File Naming

Use this default naming pattern:

`{parent-topic-id}-{slugified-section-title}.dita`

Slug rules:

- Lowercase letters.
- Replace spaces and separators with hyphens.
- Remove punctuation and special characters.
- Collapse repeated hyphens.
- Keep the name short but clear.

If a file already exists or two section titles produce the same slug, add a short unique suffix.

### 5. Topic IDs

Set the child topic ID to the filename without `.dita`.

Example:

- File: `sample-addon-quick-installation.dita`
- Topic ID: `sample-addon-quick-installation`

The old section `id` attribute is dropped with the `<section>` wrapper, unless preserving that ID is required for a valid cross-reference target. If another file links to the section ID, update those links to target the new child topic.

### 6. Cross-Reference Fixup

Fix links only when a target moved because of the extraction. Do not change link text.

Update references that point to moved elements:

- From `#old-topic-id/element-id`
- To `child-file.dita#child-topic-id/element-id`

Update references that point to the extracted section itself:

- From `#old-topic-id/old-section-id`
- To `child-file.dita#child-topic-id`

Also check links from nearby topics when practical, especially when the extracted section IDs were used as targets from other files.

Do not change external links, key references, unrelated local links, or links to content that stayed in the parent topic.

### 7. DITA Map Update

Add the new child topicrefs under the parent topicref in the same order as the original sections.

Use the active DITA map unless the user gives a different map. For add-on documentation, use `DITA-addons/add-ons.ditamap` when applicable.

Use `add_dita_reference_to_ditamap` for map updates when the tool is available.

Do not add related-links from the parent topic to the new child topics. The map hierarchy already creates those links in the published output.

### 8. Validation

Validate every changed or created file:

- Parent topic.
- Each child topic.
- Updated DITA map.

When practical, re-read the saved parent and child topics after editing and compare the content mapping against the original sections. This extra check helps confirm that no content was lost during the split.

Fix validation errors before reporting completion. If validation requires a content change beyond the structural rules, keep it minimal and report it.

## Verification Report

After the refactoring, provide a concise verification report in the chat. The report must show where the original content went so the user can confirm that no content was lost.

Include:

1. Parent topic file.
2. Created child topic files in order.
3. A content mapping table with each extracted section title and destination file.
4. Any preserved pre-section body content.
5. Any changed cross-references.
6. Validation results.

If no cross-reference fixups were needed, say so explicitly.

Do not create log files unless the user requests them. If the user requests persistent logs, save them in a task-specific `logs/` folder and do not overwrite earlier logs.

## Before And After Pattern

Before, inside the original topic body:

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

After, in the parent topic body:

```xml
<body>
  <p id="p_intro">Intro paragraph.</p>
</body>
```

After, in child topic file `sample-addon-quick-installation.dita`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE topic PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">
<topic id="sample-addon-quick-installation">
  <title>Quick Installation</title>
  <body>
    <p id="p_xyz">Install content here.</p>
  </body>
</topic>
```

The section wrapper and its ID are removed. The section title becomes the child topic title. All other content is preserved.

## Project-Specific Notes

For add-on documentation in `DITA-addons`:

- Prefer the same folder as the parent add-on topic for new child topics.
- Add child topicrefs under the existing add-on topicref in `add-ons.ditamap`.
- Keep the reading flow clear because some add-on topics may publish as continuous pages depending on map chunking.
- If an add-on topic already has child topics, review the existing structure before adding more.

Historical examples or old verification logs can help you understand prior work, but they are not required inputs for this skill.
