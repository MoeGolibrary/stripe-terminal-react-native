#!/usr/bin/env bash

set -xeuo pipefail

#if [[ $BRANCH_NAME != "production" ]]
#then
#  echo "WARN: skip release on branch $BRANCH_NAME"
#  exit 0
#fi

export XDG_DATA_HOME="$PWD/.cache"
export HOME="$PWD/.cache"
mkdir -p .cache

npx npm-cli-login \
  -u "$NPM_PUBLISHER_USR" \
  -p "$NPM_PUBLISHER_PSW" \
  -e devops@moego.pet \
  -r "https://nexus.devops.moego.pet/repository/npm-local" # Please note here cannot add end slash

yarn --frozen-lockfile --no-cache
yarn run release
