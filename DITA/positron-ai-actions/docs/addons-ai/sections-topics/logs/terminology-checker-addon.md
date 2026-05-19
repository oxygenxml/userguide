# Sections-to-Topics Refactoring Log
**Source topic:** `DITA-addons/add-ons/terminology-checker-addon.dita`  
**DITA map:** `DITA-addons/add-ons.ditamap`  
**Date:** 2026-05-19

---

## Summary

The original monolithic topic contained 10 sections (plus a Resources paragraph). All sections were extracted into standalone child topics. The parent topic was retained as a lightweight overview.

---

## Content Mapping

| Original Section | Child Topic File |
|---|---|
| *(intro paragraph + compatibility note + webinar link)* | Kept in parent `terminology-checker-addon.dita` |
| Quick Installation | `terminology-checker-addon-quick-installation.dita` |
| Manual Installation | `terminology-checker-addon-manual-installation.dita` |
| Creating Custom Rules for the Terminology Checker | `terminology-checker-addon-creating-custom-rules.dita` |
| Structure of Terminology Rules File | `terminology-checker-addon-rules-file-structure.dita` |
| Using Vale Rules with the Terminology Checker | `terminology-checker-addon-vale-rules.dita` |
| Working with the Terminology Checker | `terminology-checker-addon-working-with.dita` |
| Terminology Checker Preferences | `terminology-checker-addon-preferences.dita` |
| Checking Multiple Resources | `terminology-checker-addon-checking-multiple-resources.dita` |
| Terminology Files Contributed from Other Oxygen Add-ons | `terminology-checker-addon-contributed-terminology-files.dita` |
| ASD Simplified Technical English Specification (ASD-STE100) Rules | `terminology-checker-addon-asd-ste100.dita` |
| MS Writing Style Guide Vale Rules | `terminology-checker-addon-ms-style-guide.dita` |
| AI Extensions | `terminology-checker-addon-ai-extensions.dita` |
| *(Resources — single webinar link)* | `terminology-checker-addon-resources.dita` (extracted 2026-05-19, post-initial refactor) |

---

## Child Topics — Validation

| # | File | Validation |
|---|---|---|
| 1 | `terminology-checker-addon-quick-installation.dita` | ✅ No errors |
| 2 | `terminology-checker-addon-manual-installation.dita` | ✅ No errors |
| 3 | `terminology-checker-addon-creating-custom-rules.dita` | ✅ No errors |
| 4 | `terminology-checker-addon-rules-file-structure.dita` | ✅ No errors |
| 5 | `terminology-checker-addon-vale-rules.dita` | ✅ No errors |
| 6 | `terminology-checker-addon-working-with.dita` | ✅ No errors |
| 7 | `terminology-checker-addon-preferences.dita` | ✅ No errors |
| 8 | `terminology-checker-addon-checking-multiple-resources.dita` | ✅ No errors |
| 9 | `terminology-checker-addon-contributed-terminology-files.dita` | ✅ No errors |
| 10 | `terminology-checker-addon-asd-ste100.dita` | ✅ No errors |
| 11 | `terminology-checker-addon-ms-style-guide.dita` | ✅ No errors |
| 12 | `terminology-checker-addon-ai-extensions.dita` | ✅ No errors |
| 13 | `terminology-checker-addon-resources.dita` | ✅ No errors |

---

## Cross-Reference Fixups

| Original Reference | Updated To |
|---|---|
| `#terminology-checker-addon/section_pbf_5yg_rsb` (×2) | `terminology-checker-addon-manual-installation.dita` |
| `#./section_t41_3vc_xsb` (×1) | `terminology-checker-addon-checking-multiple-resources.dita` |

No cross-references from other files pointed to sections in this topic.

---

## DITA Map Changes

12 child topicrefs added under `terminology-checker-addon` in `add-ons.ditamap`, in original section order. Map validation: ✅ No errors.

---

## Structural Fixes Applied During Extraction

| File | Issue | Fix |
|---|---|---|
| `terminology-checker-addon-rules-file-structure.dita` | Nested `<p><dl>` inside outer `<p>` | Removed extra `<p>` wrapper |
| `terminology-checker-addon-preferences.dita` | `<p><dl>` nested via extra `<p>` inside `<dd>` | Flattened to `<p><dl>` directly inside `<dd>` |
