#!/bin/bash
set -e

image_tag="${1:-latest}"
docker build --platform=linux/amd64,linux/arm64 -t izim/harness-plugin:${image_tag} .
