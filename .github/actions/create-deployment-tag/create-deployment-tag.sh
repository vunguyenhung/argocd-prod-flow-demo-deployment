#!/bin/bash

# Get inputs
env=$1
version=$2
run_number=$3

# Construct the deployment tag
deployment_tag="v${version}-${run_number}-${env}"

# Configure Git
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"

# Create and push the tag
git tag -a $deployment_tag -m "Deployment tag for ${env} environment"
git push origin $deployment_tag

# Output the deployment tag
echo "deployment_tag=${deployment_tag}" >> $GITHUB_ENV