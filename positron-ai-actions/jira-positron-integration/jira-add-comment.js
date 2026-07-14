#!/usr/bin/env node

var fs = require('fs');
var https = require('https');
var path = require('path');

var args = process.argv.slice(2);
var issueKey = args[0];

function printUsage() {
  console.error('Usage: node jira-add-comment.js <ISSUE_KEY> [comment text]');
  console.error('   or: node jira-add-comment.js <ISSUE_KEY> --file <path-to-comment.txt>');
}

if (!issueKey) {
  printUsage();
  process.exit(1);
}

var token = process.env.JIRA_PERSONAL_TOKEN || process.env.SECRET_JIRA_PERSONAL_TOKEN;
if (!token) {
  console.error('Error: JIRA_PERSONAL_TOKEN or SECRET_JIRA_PERSONAL_TOKEN must be set.');
  console.error('Create a token at: Jira profile > Personal access tokens');
  process.exit(1);
}

var commentBody = '';
if (args[1] === '--file') {
  var filePath = args[2];
  if (!filePath) {
    printUsage();
    process.exit(1);
  }
  commentBody = fs.readFileSync(path.resolve(filePath), 'utf8');
} else {
  commentBody = args.slice(1).join(' ').trim();
}

if (!commentBody) {
  console.error('Error: Comment body is empty.');
  process.exit(1);
}

var requestBody = JSON.stringify({ body: commentBody });
var options = {
  hostname: 'jira.sync.ro',
  port: 443,
  path: '/rest/api/2/issue/' + encodeURIComponent(issueKey) + '/comment',
  method: 'POST',
  headers: {
    'Authorization': 'Bearer ' + token,
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'Content-Length': Buffer.byteLength(requestBody)
  }
};

var req = https.request(options, function(res) {
  var data = '';
  res.setEncoding('utf8');
  res.on('data', function(chunk) {
    data += chunk;
  });
  res.on('end', function() {
    if (res.statusCode < 200 || res.statusCode >= 300) {
      console.error('HTTP ' + res.statusCode + ' ' + res.statusMessage);
      console.error(data);
      process.exit(1);
    }
    try {
      var json = JSON.parse(data);
      console.log(JSON.stringify({
        issueKey: issueKey,
        commentId: json.id,
        created: json.created,
        author: json.author && json.author.displayName,
        url: 'https://jira.sync.ro/browse/' + issueKey
      }, null, 2));
    } catch (e) {
      console.log(data);
    }
  });
});

req.on('error', function(err) {
  console.error(err && err.stack ? err.stack : String(err));
  process.exit(1);
});

req.write(requestBody);
req.end();
