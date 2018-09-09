#!/bin/bash

source meta.sh

jfrog bt package-create \
      --licenses "${LICENSE}" \
      --vcs-url "${VCS_URL}" \
      --website-url "${WEBSITE_URL}" \
      --desc "${DESCRIPTION}" \
      "${REPO}"
