# Oxygen User Guide Project - AI Context Instructions

## Project Overview
This is a comprehensive DITA-based user guide project for Oxygen XML products, using a sophisticated multi-product publishing system with extensive customization and validation rules.

## Framework & Architecture
- **Documentation Framework**: DITA XML with custom extensions
- **Main Map**: `UserManual.ditamap` (bookmap structure)
- **Project File**: `userguide.xpr` (Oxygen project configuration)
- **Build System**: DITA-OT with custom plugins and transformations

## Content Organization

### Directory Structure
- `topics/` - Individual DITA topic files (2000+ topics)
- `maps/` - Chapter-level DITA maps and submaps
- `reusables/` - Reusable content components and key definitions
- `resources/` - Images, stylesheets, and other assets
- `rules/` - Validation rules and style guide enforcement
- `glossary/` - Terminology and glossary entries

### Key Files
- `maps/keydefs.ditamap` - Product names, versions, and key definitions
- `reusables/reusables.ditamap` - Reusable content library
- `rules/rules.sch` - Schematron validation rules
- `rules/library.sch` - Validation rule templates

## Content Conventions

### Product Filtering
- Use `product` attribute for conditional publishing
- Standard products: `author`, `developer`, `editor`, `webauthor`, `svnClient`, etc.
- Eclipse variants: `authorEclipse`, `developerEclipse`, `editorEclipse`
- Key references: `<ph keyref="product"/>` for product names

### ID Patterns
- Topic IDs: Use descriptive, hyphenated names (e.g., `ai_positron`, `dita-map-transform`)
- Section IDs: Descriptive with context (e.g., `section_x2n_vhh_vrb`)
- Element IDs: Sequential patterns for lists/items (e.g., `li_uf1_w1l_f2c`)

### Content Structure
- **Topics**: Use standard DITA topic structure with `<prolog>` metadata
- **Sections**: Organize content with meaningful `<section>` elements
- **Cross-references**: Use `<xref>` with descriptive link text
- **External links**: Use `format="html" scope="external"` for web links

### Metadata Requirements
- Include `<indexterm>` elements in `<prolog><metadata><keywords>`
- Use `<shortdesc>` for topic summaries
- Add `<data name="wh-menu"><data name="hide" value="yes"/></data>` to hide from WebHelp menu when needed

### Reusable Content
- Reference reusable content: `<ph conkeyref="reusables-ai-plugin/note_qpr_zj4_2xb"/>`
- Use key definitions for product names, versions, and common phrases
- Store reusable snippets in `reusables/topics/` directory

## Validation & Quality

### Style Guide Rules
- Avoid "oXygen" in index terms (use "Oxygen")
- Follow consistent terminology from glossary
- Use proper UI control markup: `<uicontrol>`, `<menucascade>`
- Format code elements with `<codeph>` or `<codeblock>`

### Content Validation
- All content validated against custom Schematron rules
- Automatic validation on save through project configuration
- Style guide enforcement through `rules/styleguide.sch`

## File Naming Conventions
- Topics: Lowercase with hyphens (e.g., `ai-positron-installation.dita`)
- Maps: Descriptive with context (e.g., `chapter-introduction.ditamap`)
- Images: Descriptive names in `img/` directory
- Use consistent prefixes for related topics (e.g., `ai_positron-`, `dita-`, `webhelp-`)

## Writing Guidelines
- **Audience**: Technical users, developers, content creators
- **Tone**: Professional, clear, instructional
- **Structure**: Task-oriented with clear steps
- **Links**: Provide meaningful link text, avoid "click here"
- **Examples**: Include practical code samples and screenshots when relevant

## Technical Integration
- **Version Control**: Content references external resources through keys
- **Localization**: Support for multiple languages through conditional text
- **Publishing**: Multiple output formats (PDF, WebHelp, Eclipse Help)
- **Customization**: Extensive CSS and XSLT customizations for different products

## AI Content Creation Guidelines
When creating new content:
1. Follow existing topic structure patterns
2. Use appropriate product filtering attributes
3. Include proper metadata and indexing
4. Reference reusable content where applicable
5. Validate against project rules before finalizing
6. Maintain consistency with existing terminology and style
7. Structure content for multiple output formats
8. Include relevant cross-references and related links

This project represents enterprise-level technical documentation with sophisticated content management, validation, and publishing workflows.