---
name: jira-positron-integration
description: Extends the AI context with Jira issue data when a tech writer works on documentation. Use when the user references a Jira issue key (e.g. PROJ-123), when an issue has reached the documentation stage and the developer has added important information in the issue, or when the tech writer needs to update existing docs or create new documentation topics from that Jira context.
---

# Jira + AI Positron Integration

This skill extends the AI's context with data from a Jira issue so the AI can help the tech writer **update existing documentation** or **create new documentation topics** using the information the developer put in the issue.

## Purpose and scenario

1. **Flow:** Developer completed work → issue moved to the **documentation stage** → developer added important information in the Jira issue, such as summary, description, acceptance criteria, notes, and comments.
2. **Tech writer's task:** Either **update existing documentation** or **create new documentation topics**, using that Jira content as the main source of context.
3. **Role of this skill:** Fetch the Jira issue and treat it as **extended context**. Use that context in every suggestion: what to add, what to change, and how to structure new or updated topics.

## When to use

1. User mentions a Jira issue key, such as `PROJ-123` or `DOC-456`.
2. User says they are documenting a Jira ticket, that an issue is in the documentation stage, or that they need to pull data from Jira.
3. User wants to update existing docs or create new topics and the content or requirements are in a Jira issue.

## Getting Jira Data

### Option 1: Run the fetch script

The project includes a script that reads `JIRA_PERSONAL_TOKEN` and fetches issue data from `https://jira.sync.ro/`. The script lives next to the skill file in `jira-fetch.js`.

1. Check if Node.js is installed:

   ```bash
   node --version
   ```

2. If Node.js is not installed, install it.

   Windows:

   ```bash
   winget install OpenJS.NodeJS.LTS
   ```

   macOS:

   ```bash
   brew install node
   ```

3. Set `JIRA_PERSONAL_TOKEN`. Create it from Jira profile → Personal access tokens.
4. Run the script for a single issue in the default documentation-friendly mode:

   ```bash
   node jira-fetch.js <ISSUE_KEY>
   ```

   Example:

   ```bash
   node jira-fetch.js PROJ-123
   ```

5. Run the script for a single issue in full mode when you need all fields with labels:

   ```bash
   node jira-fetch.js <ISSUE_KEY> --full
   ```

6. When an issue has attachments, the default output also includes attachment metadata such as file name, MIME type, size, author, and Jira download URLs.
7. Keep attachment metadata in the main Jira fetch output so the AI can see that images exist and can reference them as supporting context.
8. If the user wants to inspect a Jira image attachment manually, they can download it locally with `node jira-download-image-attachment.js <ISSUE_KEY> <ATTACHMENT_ID>`. The script saves the image in a local `tmp` folder next to the script and returns the local path so the AI can ask the user to attach that file in the next message.
9. Run the script with no issue key to get the current user's assigned issues:

   ```bash
   node jira-fetch.js
   ```

### Add Jira comments

The project also includes a script that can post comments to Jira issues. The script lives next to the skill file in `jira-add-comment.js`.

1. Set `JIRA_PERSONAL_TOKEN`. Create it from Jira profile → Personal access tokens.
2. Post a short comment directly from the command line:

   ```bash
   node jira-add-comment.js <ISSUE_KEY> "Comment text"
   ```

3. Post a longer comment from a text file:

   ```bash
   node jira-add-comment.js <ISSUE_KEY> --file <path-to-comment.txt>
   ```

4. Best practice: when the comment was prepared or posted through this workflow, mention that it was added via AI Positron.
5. Use this only when the user asked to add a Jira comment or clearly approved posting one.

### Option 2: User pastes JSON

If the user already fetched or copied the issue JSON from Jira, use that directly.

## Script output

### Default output for documentation

When you run `node jira-fetch.js <ISSUE_KEY>`, the script returns a compact JSON object focused on documentation work.

1. Top-level fields include:
   1. `key`
   2. `url`
   3. `summary`
   4. `description`
   5. `status`
   6. `issueType`
   7. `priority`
   8. `resolution`
   9. `assignee`
   10. `reporter`
   11. `fixVersions`
   12. `affectsVersions`
   13. `components`
   14. `labels`
2. The `notes` object includes important custom fields with both Jira field IDs and human-readable labels:
   1. `qa`
   2. `documentation`
   3. `site`
   4. `security`
3. The `comments` array includes simplified comments that may contain implementation details useful for documentation:
   1. `author`
   2. `created`
   3. `updated`
   4. `body`
4. The `attachments` array includes attachment metadata so the AI can identify available supporting files, especially screenshots and other images:
   1. `id`
   2. `filename`
   3. `mimeType`
   4. `size`
   5. `contentUrl`
   6. `thumbnailUrl`
   7. `created`
   8. `author`
   9. `isImage`

This format is the preferred source for documentation flows because it keeps the important context and removes most Jira noise.

### Full output

When you run `node jira-fetch.js <ISSUE_KEY> --full`, the script returns all Jira fields for the issue.

1. Each field is keyed by its Jira field ID or system name.
2. Each field includes:
   1. `label`
   2. `value`
3. This mode is useful when you need to inspect raw Jira data or discover additional fields.

### Attachment handling limitation

1. Attachment metadata is useful because it tells the AI that screenshots or other supporting files exist on the Jira issue.
2. In the current setup, image content itself is not automatically interpreted.
3. Treat Jira image attachments as metadata only.
4. Keep the attachment information from `jira-fetch.js` so the AI can mention that screenshots or other images exist when relevant.
5. If the user explicitly wants image inspection, use `jira-download-image-attachment.js` to save the file locally, then ask the user to attach that downloaded file in the next message.

## Using Jira data as extended context

Treat the issue data as **extended context** for all documentation work. Use it to decide what to add, change, or structure.

### Update existing documentation

1. **Match scope:** Use the issue summary, description, notes, and comments to identify which existing sections, topics, or files are affected.
2. **Gaps and changes:** Use the documentation note, QA note, and relevant comments to find what is new or changed compared to the current docs.
3. **Consistency:** Keep the existing doc style and structure. Only add or change content that the Jira issue justifies.

### Create new documentation topics

1. **Title:** Prefer `summary` as the topic title. Adjust it if needed for end users.
2. **Body:** Build the topic from `description`, `notes.documentation.value`, and relevant comments.
3. **Metadata:** Include issue key, status, type, versions, and Jira link when useful.
4. **Tone:** Adapt developer wording to the doc audience.

## Important fields for documentation

1. `summary` is usually the best starting point for the topic title.
2. `description` gives the main feature or change summary.
3. `notes.documentation.value` is often the most direct source for what to document.
4. `notes.qa.value` can reveal behavior details, edge cases, and test scenarios.
5. `comments` can contain implementation decisions, UX clarifications, and late changes.
6. `attachments` help identify screenshots or other visual evidence that may clarify the feature or bug, even if the current workflow cannot automatically interpret the image content itself.
7. `components`, `fixVersions`, and `labels` help place the content in the right product area and release.

## Error handling

1. **Script fails or no token:** Remind the user to set `JIRA_PERSONAL_TOKEN` and point to Jira profile → Personal access tokens.
2. **HTTP 401 or 403:** Token is invalid or expired. The user must create a new token.
3. **HTTP 404:** Issue key not found or no access. Confirm the key and permissions.
4. **Comment post fails:** Check the token, issue key, and Jira permissions. If the comment is long, prefer the `--file` option.
5. **No JSON or partial paste:** Ask for the full issue JSON or suggest running `node jira-fetch.js <ISSUE_KEY>` and sharing the output.
6. **Image needs visual inspection:** Suggest running `node jira-download-image-attachment.js <ISSUE_KEY> <ATTACHMENT_ID>`, then ask the user to attach the downloaded local file in the next message.

## Summary

1. Use `node jira-fetch.js <ISSUE_KEY>` for the default documentation-friendly output.
2. Use `node jira-fetch.js <ISSUE_KEY> --full` when you need all Jira fields with labels.
3. Use `node jira-add-comment.js <ISSUE_KEY> "Comment text"` or `node jira-add-comment.js <ISSUE_KEY> --file <path>` to add Jira comments.
4. As a best practice, Jira comments added through this workflow should mention that they were added via AI Positron.
5. Treat the Jira issue as the source of truth for documentation updates and new topics.
6. Keep attachment metadata from the main Jira fetch flow, and treat image attachments as supporting context unless the user attaches a downloaded local image in a follow-up message.
7. Use `node jira-download-image-attachment.js <ISSUE_KEY> <ATTACHMENT_ID>` when the user wants to inspect a Jira image attachment and then ask them to attach the downloaded file.
8. Prefer `summary`, `description`, `notes.documentation`, `notes.qa`, and relevant comments when drafting documentation.
