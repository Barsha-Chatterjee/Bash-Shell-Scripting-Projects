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

# Function to list users with access to the repo
function list_users_with_access {
local endpoint="repos/${REPO_OWNER}/${REPO_NAME}/collaborators"

# Fetch list of collaborators in repo
collaborators="$(github_api_call "$endpoint" 

# Display the list of collaborators with access
    if [[ -z "$collaborators" ]]; then
        echo "No users with access found for ${REPO_OWNER}/${REPO_NAME}."
    else
        echo "Users with access to ${REPO_OWNER}/${REPO_NAME}:"
        echo "$collaborators"
    fi
}

# Main script

echo "Listing users with access to ${REPO_OWNER}/${REPO_NAME}..."
list_users_with_access






