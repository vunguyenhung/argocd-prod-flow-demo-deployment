#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Get inputs from ENV
env=$ENV
version=$VERSION
run_number=$RUN_NUMBER

# Construct the deployment tag
deployment_tag="v${version}-${run_number}-${env}"

# Configure Git
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

# Create and push the tag
git tag -a $deployment_tag -m "Deployment tag for ${env} environment"
git push origin $deployment_tag

# Output the deployment tag
echo "deployment_tag=${deployment_tag}" >> $GITHUB_OUTPUT