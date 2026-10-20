# Translating a manual

Use this procedure to translate a user manual into a new language, or to update an existing
translation, and then review the result.

All examples translate the **Content Fusion Cloud** manual into **French** (`fr-FR`). For another
manual or language, replace the example values with your own.

## Steps at a glance

1. [Collect the values you need](#1-collect-the-values-you-need)
2. [Create a translation branch](#2-create-a-translation-branch)
3. [Prepare the language resources](#3-prepare-the-language-resources)
4. [Translate](#4-translate)
5. [Review the translation](#5-review-the-translation)
6. [Integrate the translation branch](#6-integrate-the-translation-branch)

## 1. Collect the values you need

You use these values in every step. Write them down before you start.

- **Product name**: the product, exactly as listed in the `Products` table of
  `.contentfusion/i18n/agent-instructions.md`.
  Example: `Content Fusion Cloud`
- **`<product>`**: the folder that holds the product's language resources.
  Example: `fusion`
- **`<lang>`**: the target language, as a BCP 47 tag (with a hyphen).
  Example: `fr-FR`
- **`<lang_>`**: the same language with an underscore. UI strings file names use this form.
  Example: `fr_FR`
- **Output folder**: the folder that receives the translated files.
  Example: `DITA-cf/i18n/fusion-cloud/fr-FR/`
- **Ticket**: the Jira ticket for the work.
  Example: `CF-1234`

## 2. Create a translation branch

In Content Fusion,
[create a branch](https://www.oxygenxml.com/doc/versions/9.2/ug-content-fusion-cloud/topics/cf-projects-workspace.html?hl=create%2Cnew%2Cbranch#cf-projects-workspace__section-br-mgmnt)
named `translation/<ticket>-translate-<lang>`.

Example: `translation/CF-1234-translate-fr-FR`

Do all the work in the next steps on this branch.

## 3. Prepare the language resources

The translation agent reads three files from `.contentfusion/i18n/`:

- **`agent-instructions.md`**: the rules the agent applies to every translation.
- **`<product>/terminology/terminology.en-US-<lang>.md`**: approved terms and terms that must not
  be translated.
  Example: `fusion/terminology/terminology.en-US-fr-FR.md`
- **`<product>/terminology/ui-strings.<lang_>.md`**: the product's translated UI labels.
  Example: `fusion/terminology/ui-strings.fr_FR.md`

> **Note:** If the terminology or UI strings file is missing for a language, the agent still
> translates, but the quality is lower.

Do these tasks to make sure the files are present and up to date.

### 3.1 Get the latest UI strings

1. Get the latest XML UI strings for the product. Follow the instructions on the
   [Oxygen i18n wiki page](https://[internal host removed]/topics/sdlc/projects/exm/internationalizare_oxygen_oxygen_i18n.html).
2. Save the XML files in `translation/xml-translation/<product>/`.

   Example: `translation/xml-translation/fusion/`

### 3.2 Convert the UI strings to Markdown

The agent can't read the XML files. Convert them to Markdown with the
`translation/ui-strings-to-md.xsl` stylesheet.

Choose one option:

- [Option A: Run the script](#option-a-run-the-script). Needs Java 11 or later and Saxon-HE 12.
- [Option B: Run the stylesheet in Oxygen XML Editor](#option-b-run-the-stylesheet-in-oxygen-xml-editor).
  No extra installs: Oxygen XML Editor includes Saxon.

Both options write one `ui-strings.<lang_>.md` file for each language in the XML files.

#### Option A: Run the script

1. Open the script in a text editor:

   - Windows: `translation\ui-strings-to-md.bat`
   - Linux, macOS, or Git Bash: `translation/ui-strings-to-md.sh`

2. In the `Settings` section at the top of the script, check these variables. Relative paths start
   from the `translation` folder.

   - **`IN_DIR`**: the folder with the XML files from step 3.1.
     Example: `xml-translation/fusion`
   - **`OUT_DIR`**: the product's terminology folder.
     Example: `../.contentfusion/i18n/fusion/terminology`
   - **`SAXON_LIB`**: leave it empty if Saxon-HE 12 is in your local Maven repository
     (`~/.m2/repository`). Otherwise, set it to the folder of the Saxon-HE 12 download (the folder
     with the Saxon jar and its `lib/` subfolder).

   > **Tip:** To use other folders for one run without editing the script, pass them as arguments:
   > `translation\ui-strings-to-md.bat in=<input folder> out=<output folder>`

3. Run the script. You can run it from any folder.

   Windows:

   ```
   translation\ui-strings-to-md.bat
   ```

   Linux, macOS, or Git Bash:

   ```bash
   translation/ui-strings-to-md.sh
   ```

   The script lists each file it writes. It also warns about strings that have no translation in a
   language.

4. If the script stops with an `ERROR:` line, fix the cause and run it again. Common causes: Java
   or Saxon is not found, or the input folder is wrong.
5. Check the diff of the Markdown files, then commit them.

#### Option B: Run the stylesheet in Oxygen XML Editor

1. In Oxygen XML Editor, open `translation/ui-strings-to-md.xsl`.
2. Create a transformation scenario:

   1. Select **Configure Transformation Scenario(s)**, then **New** > **XSLT transformation**.
   2. Leave the **XML URL** field empty.
   3. Set **Transformer** to Saxon-HE, PE, or EE, version 12 or later.
   4. In the Saxon advanced options, set **Initial template** to `xsl:initial-template`.

3. Click **Parameters** and set these parameters. Relative paths start from the `translation`
   folder.

   - **`in`**: the folder with the XML files from step 3.1.
     Example: `xml-translation/fusion/`
   - **`out`**: the product's terminology folder.
     Example: `../.contentfusion/i18n/fusion/terminology/`

4. Apply the scenario.

   The Markdown files are written to the `out` folder. Warnings about missing translations appear
   in the **Results** panel.

5. Check the diff of the Markdown files, then commit them.

### 3.3 Register a new product

Skip this task if the product is already in the `Products` table of
`.contentfusion/i18n/agent-instructions.md`.

Otherwise, add a row to that table with the product name and its `<product>` folder.

> **Important:** If the product is not in the table, the agent stops before it translates anything.

## 4. Translate

1. Open the `User Guide` project in Content Fusion.
2. Start a translation. In the prompt, name the product and the output folder.

   Example:

   ```
   Translations are for product: `Content Fusion Cloud`.

   Save translations to `DITA-cf/i18n/fusion-cloud/fr-FR/`, mirroring the source structure inside it.
   ```

## 5. Review the translation

1. Open `translation/review-prompt.md`.
2. In the `Variables` section, set `TARGET_LANG` to the target language.

   Example: `TARGET_LANG = fr-FR`

3. Give the prompt to the AI assistant.

   The reviewer compares each translated file with its source. It writes a report to
   `translation-review-<lang>.md` at the repository root.

4. Read the report. Start with the root-cause rollup: a few root causes usually explain most of the
   issues.
5. Fix the issues:

   - **Root causes**: fix them in the terminology file or in `agent-instructions.md`. Then translate
     the affected files again.
   - **One-off issues**: fix them directly in the translated file.

6. Commit all changes to the translation branch.

## 6. Integrate the translation branch

In `Content Fusion`, integrate the translation branch.
