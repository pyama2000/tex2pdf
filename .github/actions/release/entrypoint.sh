#!/bin/ash
set -eux

TAG_NAME=`echo ${GITHUB_REF:10}`

REQUEST=`curl -H "Authorization: token ${GITHUB_TOKEN}" \
  -X POST https://api.github.com/repos/${GITHUB_REPOSITORY}/releases \
  -d "
  {
    \"tag_name\": \"$TAG_NAME\",
    \"target_commitish\": \"$GITHUB_SHA\",
    \"name\": \"$FILE_NAME.pdf\",
    \"draft\": false,
    \"prerelease\": false
  }"`

RELEASE_ID=`echo ${REQUEST} | jq ".id"`

curl -H "Authorization: token ${GITHUB_TOKEN}" \
  -X POST https://uploads.github.com/repos/${GITHUB_REPOSITORY}/releases/${RELEASE_ID}/assets?name=${TAG_NAME}.pdf \
  --header 'Content-Type: application/pdf' \
  --upload-file texfiles/${FILE_NAME}.pdf
