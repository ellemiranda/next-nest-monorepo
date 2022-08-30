#!/bin/bash

set -e

source .github/common/set-env-vars.sh

echo "Login to Docker registry"

aws ecr get-login-password --region us-east-1 | docker login \
    --username AWS \
    --password-stdin $DOCKER_REGISTRY