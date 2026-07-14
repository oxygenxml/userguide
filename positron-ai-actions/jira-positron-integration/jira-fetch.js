var pat = process.env.JIRA_PERSONAL_TOKEN || process.env.SECRET_JIRA_PERSONAL_TOKEN;
var issueKey = process.argv[2];
var outputMode = process.argv[3] || "summary";

if (!pat) {
  console.error("Error: JIRA_PERSONAL_TOKEN or SECRET_JIRA_PERSONAL_TOKEN must be set.");
  console.error("Create a token at: Jira profile > Personal access tokens");
  process.exit(1);
}

var baseUrl = "https://jira.sync.ro";
var issueUrl = issueKey
  ? baseUrl + "/rest/api/2/issue/" + issueKey
  : baseUrl + "/rest/api/2/search?jql=assignee=currentUser()";

function jiraFetch(url) {
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

function getFieldMap() {
  return jiraFetch(baseUrl + "/rest/api/2/field").then(function (fields) {
    var map = {};

    fields.forEach(function (field) {
      map[field.id] = field.name;
    });

    return map;
  });
}

function getFieldValue(fields, key) {
  return Object.prototype.hasOwnProperty.call(fields, key) ? fields[key] : null;
}

function getFieldLabel(fieldMap, key) {
  return fieldMap[key] || key;
}

function getNamedField(fields, fieldMap, key) {
  return {
    id: key,
    label: getFieldLabel(fieldMap, key),
    value: getFieldValue(fields, key)
  };
}

function getNestedName(obj) {
  return obj && obj.name ? obj.name : null;
}

function getUserDisplayName(user) {
  return user && user.displayName ? user.displayName : null;
}

function isImageAttachment(attachment) {
  return !!(attachment && attachment.mimeType && attachment.mimeType.indexOf("image/") === 0);
}

function getAttachmentMetadata(attachments) {
  return (attachments || []).map(function (attachment) {
    return {
      id: attachment.id || null,
      filename: attachment.filename || null,
      mimeType: attachment.mimeType || null,
      size: attachment.size || null,
      contentUrl: attachment.content || null,
      thumbnailUrl: attachment.thumbnail || null,
      created: attachment.created || null,
      author: getUserDisplayName(attachment.author),
      isImage: isImageAttachment(attachment)
    };
  });
}

function getCommentsForDocumentation(commentField) {
  var comments = commentField && commentField.comments ? commentField.comments : [];

  return comments.map(function (comment) {
    return {
      author: getUserDisplayName(comment.author),
      created: comment.created || null,
      updated: comment.updated || null,
      body: comment.body || ""
    };
  }).filter(function (comment) {
    return comment.body && comment.body.trim().length > 0;
  });
}

function buildDocumentationOutput(data, fieldMap) {
  var fields = data.fields || {};

  return {
    key: data.key,
    url: baseUrl + "/browse/" + data.key,
    summary: getFieldValue(fields, "summary"),
    description: getFieldValue(fields, "description"),
    status: getNestedName(getFieldValue(fields, "status")),
    issueType: getNestedName(getFieldValue(fields, "issuetype")),
    priority: getNestedName(getFieldValue(fields, "priority")),
    resolution: getNestedName(getFieldValue(fields, "resolution")),
    assignee: getUserDisplayName(getFieldValue(fields, "assignee")),
    reporter: getUserDisplayName(getFieldValue(fields, "reporter")),
    fixVersions: (getFieldValue(fields, "fixVersions") || []).map(function (version) {
      return version.name;
    }),
    affectsVersions: (getFieldValue(fields, "versions") || []).map(function (version) {
      return version.name;
    }),
    components: (getFieldValue(fields, "components") || []).map(function (component) {
      return component.name;
    }),
    labels: getFieldValue(fields, "labels") || [],
    notes: {
      qa: getNamedField(fields, fieldMap, "customfield_10250"),
      documentation: getNamedField(fields, fieldMap, "customfield_10251"),
      site: getNamedField(fields, fieldMap, "customfield_10751"),
      security: getNamedField(fields, fieldMap, "customfield_12350")
    },
    comments: getCommentsForDocumentation(getFieldValue(fields, "comment")),
    attachments: getAttachmentMetadata(getFieldValue(fields, "attachment"))
  };
}

function enrichFields(fields, fieldMap) {
  var result = {};

  Object.keys(fields).forEach(function (key) {
    result[key] = {
      label: fieldMap[key] || key,
      value: fields[key]
    };
  });

  return result;
}

function buildFullOutput(data, fieldMap) {
  return {
    key: data.key,
    summary: data.fields.summary,
    fields: enrichFields(data.fields, fieldMap)
  };
}

function isFullMode() {
  return outputMode === "--full" || outputMode === "full";
}

function run() {
  return jiraFetch(issueUrl).then(function (data) {
    if (issueKey) {
      return getFieldMap().then(function (fieldMap) {
        var output = isFullMode()
          ? buildFullOutput(data, fieldMap)
          : buildDocumentationOutput(data, fieldMap);

        console.log(JSON.stringify(output, null, 2));
      });
    }

    console.log("Total: " + data.total + "\n");
    data.issues.forEach(function (i) {
      var priority = i.fields.priority && i.fields.priority.name ? i.fields.priority.name : "N/A";
      console.log(i.key + ": " + i.fields.summary);
      console.log("  Status: " + i.fields.status.name + " | Type: " + i.fields.issuetype.name + " | Priority: " + priority);
      console.log("  " + baseUrl + "/browse/" + i.key + "\n");
    });
  });
}

run().catch(function (e) {
  console.error(e);
  process.exit(1);
});