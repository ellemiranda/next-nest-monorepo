#!/bin/bash

JOSB=$(find . -name $FILE | jq -nRc --arg file "/$FILE" '[inputs | split($file) | .[0]]')
echo "Found $FILE paths: $JOBS"
echo "::set-output name=matrix::$JOBS"