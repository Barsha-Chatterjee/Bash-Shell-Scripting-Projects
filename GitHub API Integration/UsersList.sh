#!/bin/bash

# GitHub API URL
GitHub_API_URL="https://api.github.com"

# Enter your username and API access Token
Username=$username
Token=$token

# Owner and Repo information
Repo_owner=$1
Repo_name=$2

# Sending HTTPS GET request to GitHub API
function github_api_call {
local repo_path="$1"
local url="${GitHub_API_URL}/${repo}"

# Send a GET request to the GitHub API with authentication
  curl -s -u "${Username}:${Token}" "$url"
}

# TO BE CONTINUED......!



