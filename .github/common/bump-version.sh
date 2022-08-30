if [ "$REPO_TYPE" == "lerna" ]; then
  npx lerna version --no-git-tag-version --yes --exact "$TARGET"
else
  npm version --no-git-tag-version "$TARGET"
fi