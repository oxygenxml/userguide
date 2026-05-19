# Sections-to-Topics Refactoring — Progress Report

**Scope:** `DITA-addons/add-ons/` topic folder and `DITA-addons/add-ons.ditamap`  
**Last updated:** 2026-05-19

---

## How to Read This Report

- **Status** — `done` = already refactored into child topics; `candidate` = leaf topic with sections worth extracting; `skip` = leaf topic, sections present but not worth extracting; `n/a` = no sections or category/overview topic.
- **Sections** — number of direct `<section>` children in the topic body.
- **Notes** — reasoning for the assessment.

---

## Already Refactored ✅

These topics have been split and have child topicrefs in the map.

| Topic | Child Topics | Log |
|---|---|---|
| **Git Client Add-on** · `git-addon.dita` | 30+ (full hierarchy) | No log (pre-existing) |
| **Oxygen Content Fusion Add-on** · `content-fusion-addon.dita` | `cf-installing-configuring`, `cf_task_manager_view`, `cf-projects-view` | No log (pre-existing) |
| **Oxygen Feedback Comments Manager Add-on** · `ofb-feedback-comments-manager.dita` | 4 child topics | No log (pre-existing) |
| **Batch Converter Add-on** · `batch-converter-addon.dita` | 6 child topics | No log (pre-existing) |
| **Fluenta DITA Translation Add-on** · `fluenta-dita-translation-add-on.dita` | 1 child topic | No log (pre-existing) |
| **Terminology Checker Add-on** · `terminology-checker-addon.dita` | 12 child topics | `logs/terminology-checker-addon.md` ✅ |

---

## Leaf Topics — Assessment

### Collaboration

| Topic | Sections | Status | Notes |
|---|---|---|---|
| **Installing and Configuring the Content Fusion Add-on** · `cf-installing-configuring.dita` | 6 | skip | Already a child topic of `content-fusion-addon`; has its own children. Sections are short install steps — fine as-is. |
| **Content Fusion Task Manager View** · `cf_task_manager_view.dita` | 2 | skip | Already a child topic; only 2 sections, both short. |
| **Content Fusion Projects View** · `cf-projects-view.dita` | 6 | candidate | Leaf topic with 6 sections covering distinct UI areas. Worth extracting if content grows. |
| **Connect to an Enterprise Server** · `connect-to-enterprise-server.dita` | 2 | skip | 2 short sections, fine as-is. |

### Conversions

| Topic | Sections | Status | Notes |
|---|---|---|---|
| **Batch Converter Add-on Details** · `batch-converter-addon-details.dita` | — | n/a | No sections; already a child topic. |
| **Batch Converter Add-on Configuration** · `batch-converter-addon-configuration.dita` | — | n/a | No sections; already a child topic. |

### DITA Editing

| Topic | Sections | Status | Notes |
|---|---|---|---|
| **DITA Prolog Updater Add-on** · `dita-prolog-updater.dita` | 3 | candidate | 3 sections (Quick Install, Manual Install, Using). Follows the same pattern as terminology-checker. Good candidate. |
| **DITA Outgoing References Add-on** · `dita-outgoing-references-addon.dita` | 5 | candidate | 5 sections. Follows the same install + usage pattern. Good candidate. |

### Terminology

| Topic | Sections | Status | Notes |
|---|---|---|---|
| **Terminology Checker Add-on** · `terminology-checker-addon.dita` | 0 | **done** | Refactored 2026-05-19. See log. |
| **Vale Linter for Markdown and HTML Validation Add-on** · `vale-linter-addon.dita` | 6 | candidate | 6 sections (Quick Install, Manual Install, Configuration, Usage, Preferences, Resources). Strong candidate — mirrors terminology-checker structure. |

### Translation

| Topic | Sections | Status | Notes |
|---|---|---|---|
| **Fluenta DITA Translation Add-on** · `fluenta-dita-translation-add-on.dita` | 12 | candidate | 12 sections, only 1 child topic extracted so far. Most sections still in the parent. High-priority candidate. |
| **AI Translator Add-on** · `ai-translator-add-on.dita` | 12 | candidate | 12 sections, leaf topic. Strong candidate — large topic with distinct install, config, and usage sections. |
| **Translation Helper Add-on** · `translator-helper-addon.dita` | 4 | candidate | 4 sections. Moderate candidate. |
| **DITA Translation Package Builder Add-on** · `translation-package-builder-addon.dita` | 4 | candidate | 4 sections. Moderate candidate. |

### Productivity

| Topic | Sections | Status | Notes |
|---|---|---|---|
| **Emmet Add-on** · `emmet-addon.dita` | 4 | candidate | 4 sections. Moderate candidate. |
| **Live Tutorials Add-on** · `live-tutorials-addon.dita` | 8 | candidate | 8 sections. Good candidate. |
| **Writer Helper Add-on** · `writer-helper-addon.dita` | 7 | candidate | 7 sections. Good candidate. |

### Development

| Topic | Sections | Status | Notes |
|---|---|---|---|
| **XSpec Helper View Add-on** · `xspec-helper-view-addon.dita` | 1 | skip | Only 1 section. Not worth extracting. |
| **Saxon Transformer Add-on** · `saxon-transformer-addon.dita` | 1 | skip | Only 1 section. Not worth extracting. |
| **XSD to JSON Schema Converter Add-on** · `xsd-to-json-schema-converter-addon.dita` | 5 | candidate | 5 sections. Moderate candidate. |
| **Generate Java Classes Add-on** · `generate-java-classes-addon.dita` | 3 | candidate | 3 sections. Moderate candidate. |
| **JSON Schema Documentation Generator Add-on** · `json-schema-documentation-generator-addon.dita` | 4 | candidate | 4 sections. Moderate candidate. |
| **OpenAPI Tester Add-on** · `openapi-tester.dita` | 4 | candidate | 4 sections. Moderate candidate. |
| **OpenAPI Documentation Generator Add-on** · `openapi-documentation-generator.dita` | 5 | candidate | 5 sections. Moderate candidate. |
| **JSON Schema Validator Add-on** · `json-schema-validator-addon.dita` | 2 | skip | Only 2 short sections. Not worth extracting. |

### Others

| Topic | Sections | Status | Notes |
|---|---|---|---|
| **DocBook Checker Add-on** · `docbook-checker-addon.dita` | 2 | skip | 2 short sections. Not worth extracting. |
| **CGM Add-on** · `cgm-addon.dita` | 2 | skip | 2 short sections. Not worth extracting. |

---

## Priority Queue

Suggested order for next refactoring runs, based on section count and structural similarity to already-completed work:

| Priority | Topic | Sections | Reason |
|---|---|---|---|
| 1 | **Fluenta DITA Translation Add-on** · `fluenta-dita-translation-add-on.dita` | 12 | Largest remaining topic; partially started. |
| 2 | **AI Translator Add-on** · `ai-translator-add-on.dita` | 12 | Large, leaf, clear install+config+usage structure. |
| 3 | **Live Tutorials Add-on** · `live-tutorials-addon.dita` | 8 | 8 sections, good candidate. |
| 4 | **Writer Helper Add-on** · `writer-helper-addon.dita` | 7 | 7 sections, good candidate. |
| 5 | **Vale Linter for Markdown and HTML Validation Add-on** · `vale-linter-addon.dita` | 6 | Mirrors terminology-checker pattern exactly. |
| 6 | **Content Fusion Projects View** · `cf-projects-view.dita` | 6 | 6 sections covering distinct UI areas. |
| 7 | **OpenAPI Documentation Generator Add-on** · `openapi-documentation-generator.dita` | 5 | 5 sections. |
| 8 | **XSD to JSON Schema Converter Add-on** · `xsd-to-json-schema-converter-addon.dita` | 5 | 5 sections. |
| 9 | **DITA Outgoing References Add-on** · `dita-outgoing-references-addon.dita` | 5 | 5 sections, install+usage pattern. |
| 10 | **OpenAPI Tester Add-on** · `openapi-tester.dita` | 4 | 4 sections. |
| 11 | **JSON Schema Documentation Generator Add-on** · `json-schema-documentation-generator-addon.dita` | 4 | 4 sections. |
| 12 | **Emmet Add-on** · `emmet-addon.dita` | 4 | 4 sections. |
| 13 | **Translation Helper Add-on** · `translator-helper-addon.dita` | 4 | 4 sections. |
| 14 | **DITA Translation Package Builder Add-on** · `translation-package-builder-addon.dita` | 4 | 4 sections. |
| 15 | **Generate Java Classes Add-on** · `generate-java-classes-addon.dita` | 3 | 3 sections. |
| 16 | **DITA Prolog Updater Add-on** · `dita-prolog-updater.dita` | 3 | 3 sections, install+usage pattern. |
