#!/bin/bash

PREID="latest"

if [ -z "$ROOT" ]; then
  ROOT="."
fi

PROJECT=$(jq -r .name "$ROOT/package.json" | cut -d'/' -f2)
echo "PROJECT=$PROJECT" >> $GITHUB_ENV
echo "AWS_REGION=us-east-1" >> $GITHUB_ENV

if [ -f "lerna.json" ]; then
  echo "Lerna project detected"
  TYPE='lerna'
else
  echo "Unknow repository"
  exit 1
fi

if [ -z $VERSION ]; then
  if [[ $GITHUB_REF == refs\/tags\/v ]]; then
    echo "Getting version from semver"
    VERSION=$(npx semver "${GITHUB_REF#"refs/tags/v"}")
  elif [ "$TYPE" == 'lerna' ]; then
    echo "Getting version from lerna"
    VERSION=$(jq -r .version lerna.json)
  elif [ -f "package.json" ]; then
    echo "Getting version from package.json"
    VERSION=$(jq -r .version "$ROOT/package.json")
  else
    echo "Failed to get version"
    exit 1
  fi
fi

DOCKER_REGISTRY=925569971735.dkr.ecr.us-east-1.amazonaws.com
echo "DOCKER_REGISTRY=$DOCKER_REGISTRY" >> $GITHUB_ENV
echo "DOCKER_TAG=$DOCKER_TAG/$PROJECT:$VERSION" >> $GITHUB_ENV
echo "ROOT=$ROOT" >> $GITHUB_ENV

echo "REPO_TYPE=$TYPE" >> $GITHUB_ENV
echo "VERSION=$VERSION" >> $GITHUB_ENV
echo "::set-output name=version::$VERSION"