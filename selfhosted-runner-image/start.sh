#!/bin/bash

ACCESS_TOKEN=$ACCESS_TOKEN
ORGANIZATION=$ORGANIZATION
OWNER=$OWNER
REPO=$REPO

if [ -n "$ORGANIZATION" ]; then
  echo "get Organization token"
  REG_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" https://api.github.com/orgs/${ORGANIZATION}/actions/runners/registration-token | jq .token --raw-output)
  cd /home/docker/actions-runner
  echo "setup Organization Runner"
  ./config.sh --url https://github.com/${ORGANIZATION} --token ${REG_TOKEN}  
else
  echo "get Repository token"
  REG_TOKEN=$(curl -sX POST -H "Authorization: token ${ACCESS_TOKEN}" https://api.github.com/repos/${OWNER}/${REPO}/actions/runners/registration-token | jq .token --raw-output)
  cd /home/docker/actions-runner
  echo "setup Repository Runner"
  ./config.sh --url https://github.com/${OWNER}/${REPO} --token ${REG_TOKEN}  
fi

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${REG_TOKEN}
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

./run.sh & wait $!