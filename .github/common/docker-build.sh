#!/bin/bash

IMAGE_META="$(aws ecr describe-images --repository-name=$PROJECT --image-ids=imageTag=$VERSION 2> /dev/null)"

if [[ $? == 0 ]]; then
  echo "The version already exists n ECR"
  exit 1
fi

echo "Building Docker image for $PROJECT and version $VERSION"
docker build -t "$DOCKER_TAG" -f "$ROOT/Dockerfile.ci" .