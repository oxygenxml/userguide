var fs = require("fs");
var path = require("path");

var pat = process.env.JIRA_PERSONAL_TOKEN || process.env.SECRET_JIRA_PERSONAL_TOKEN;
var baseUrl = process.env.JIRA_BASE_URL || process.env.SECRET_JIRA_BASE_URL;
var issueKey = process.argv[2];
var attachmentIds = process.argv.slice(3);

if (!pat) {
  console.error("Error: JIRA_PERSONAL_TOKEN or SECRET_JIRA_PERSONAL_TOKEN must be set.");
  console.error("Create a token at: Jira profile > Personal access tokens");
  process.exit(1);
}

if (!baseUrl) {
  console.error("Error: JIRA_BASE_URL or SECRET_JIRA_BASE_URL must be set (e.g. https://jira.example.com).");
  process.exit(1);
}

baseUrl = baseUrl.replace(/\/+$/, "");

if (!issueKey || attachmentIds.length === 0) {
  console.error("Usage: node jira-download-image-attachment.js <ISSUE_KEY> <ATTACHMENT_ID> [ATTACHMENT_ID ...]");
  process.exit(1);
}
var issueUrl = baseUrl + "/rest/api/2/issue/" + issueKey;
var tmpDir = path.join(__dirname, "tmp");

function jiraFetchJson(url) {
  return fetch(url, {
    headers: {
      Authorization: "Bearer " + pat,
      Accept: "application/json"
    }
  }).then(function (res) {
    if (!res.ok) {
      return res.text().then(function (text) {
        console.error("HTTP " + res.status + ": " + res.statusText);
        console.error(text.slice(0, 500));
        process.exit(1);
      });
    }

    return res.json();
  });
}

function jiraFetchBinary(url) {
  return fetch(url, {
    headers: {
      Authorization: "Bearer " + pat,
      Accept: "*/*"
    }
  }).then(function (res) {
    if (!res.ok) {
      return res.text().then(function (text) {
        console.error("HTTP " + res.status + ": " + res.statusText);
        console.error(text.slice(0, 500));
        process.exit(1);
      });
    }

    return res.arrayBuffer();
  });
}

function getUserDisplayName(user) {
  return user && user.displayName ? user.displayName : null;
}

function findAttachment(attachments, id) {
  return (attachments || []).find(function (attachment) {
    return String(attachment.id) === String(id);
  }) || null;
}

function ensureTmpDir() {
  fs.mkdirSync(tmpDir, { recursive: true });
}

function sanitizeFileName(name) {
  return String(name || "attachment")
    .replace(/[<>:"/\\|?*\x00-\x1F]/g, "_")
    .replace(/\s+/g, " ")
    .trim();
}

function buildLocalFileName(issueKeyValue, attachment) {
  var safeName = sanitizeFileName(attachment.filename || "attachment");
  return issueKeyValue + "-" + String(attachment.id || "attachment") + "-" + safeName;
}

function downloadAttachment(issue, attachment) {
  return jiraFetchBinary(attachment.content).then(function (buffer) {
    var localFileName = buildLocalFileName(issue.key, attachment);
    var localFilePath = path.join(tmpDir, localFileName);
    fs.writeFileSync(localFilePath, Buffer.from(buffer));

    return {
      issueKey: issue.key,
      issueUrl: baseUrl + "/browse/" + issue.key,
      id: attachment.id || null,
      filename: attachment.filename || null,
      mimeType: attachment.mimeType || null,
      size: attachment.size || null,
      created: attachment.created || null,
      author: getUserDisplayName(attachment.author),
      contentUrl: attachment.content || null,
      thumbnailUrl: attachment.thumbnail || null,
      localPath: localFilePath,
      isImage: !!(attachment.mimeType && attachment.mimeType.indexOf("image/") === 0)
    };
  });
}

function run() {
  return jiraFetchJson(issueUrl).then(function (issue) {
    var attachments = issue.fields && issue.fields.attachment ? issue.fields.attachment : [];
    var selectedAttachments = attachmentIds.map(function (id) {
      var attachment = findAttachment(attachments, id);

      if (!attachment) {
        console.error("Attachment not found on issue " + issueKey + ": " + id);
        process.exit(1);
      }

      return attachment;
    });

    ensureTmpDir();

    return Promise.all(selectedAttachments.map(function (attachment) {
      return downloadAttachment(issue, attachment);
    })).then(function (downloads) {
      var output = {
        issueKey: issue.key,
        issueUrl: baseUrl + "/browse/" + issue.key,
        downloadedCount: downloads.length,
        attachments: downloads
      };

      console.log(JSON.stringify(output, null, 2));
    });
  });
}

run().catch(function (e) {
  console.error(e);
  process.exit(1);
});
