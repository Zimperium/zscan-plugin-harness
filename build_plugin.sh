#!/bin/bash
set -e

docker build --platform=linux/amd64,linux/arm64 -t izim/harness-plugin .
