#!/bin/bash

if [[ $VERISON =~ [0-9]+.[0-9]+.[0-9]+-(alpha|beta|rc|hotfix|test).[0-9]+$ ]]; then
  echo "preid already exists"
  exit 1
else
  echo "Searching for valid version"
  LAST_VERSION=$(git tag -l "$VERSION-$PREID*" | sort -V | tail -n1)
fi

if [ -n "$LAST_VERSION" ]; then
  npx semver "$LAST_VERSION"
  NEXT_VERSION=$(npx semver -i prerelease "$LAST_VERSION")
else
  NEXT_VERSION="$VERSION-$PREID.0"
fi

git tag "v$NEXT_VERSION"