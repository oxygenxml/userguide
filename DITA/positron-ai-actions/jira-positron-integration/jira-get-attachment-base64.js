var pat = process.env.JIRA_PERSONAL_TOKEN;
var issueKey = process.argv[2];
var attachmentId = process.argv[3];

if (!pat) {
  console.error("Error: JIRA_PERSONAL_TOKEN must be set.");
  console.error("Create a token at: Jira profile > Personal access tokens");
  process.exit(1);
}

if (!issueKey || !attachmentId) {
  console.error("Usage: node jira-get-attachment-base64.js <ISSUE_KEY> <ATTACHMENT_ID>");
  process.exit(1);
}

var baseUrl = "https://jira.sync.ro";
var issueUrl = baseUrl + "/rest/api/2/issue/" + issueKey;

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

function buildDataUrl(mimeType, base64) {
  return "data:" + mimeType + ";base64," + base64;
}

function run() {
  return jiraFetchJson(issueUrl).then(function (issue) {
    var attachments = issue.fields && issue.fields.attachment ? issue.fields.attachment : [];
    var attachment = findAttachment(attachments, attachmentId);

    if (!attachment) {
      console.error("Attachment not found on issue " + issueKey + ": " + attachmentId);
      process.exit(1);
    }

    if (!attachment.mimeType || attachment.mimeType.indexOf("image/") !== 0) {
      console.error("Attachment is not an image: " + (attachment.filename || attachmentId));
      process.exit(1);
    }

    return jiraFetchBinary(attachment.content).then(function (buffer) {
      var base64 = Buffer.from(buffer).toString("base64");
      var output = {
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
        dataUrl: buildDataUrl(attachment.mimeType, base64)
      };

      console.log(JSON.stringify(output, null, 2));
    });
  });
}

run().catch(function (e) {
  console.error(e);
  process.exit(1);
});