#!/usr/bin/env bash

set -eux -o pipefail

DOCKER_IMG="golang@sha256:e8e4c4406217b415c506815d38e3f8ac6e05d0121b19f686c5af7eaadf96f081"
SCRIPT_DIR="$(cd "$(dirname "$0")" ; pwd -P)"

docker run --rm --init -e HOME=/tmp/ --user="$(id -u):$(id -g)" \
           -v "$SCRIPT_DIR":/code -w /code  \
	   $DOCKER_IMG \
           go build -mod=vendor -o "dist/randomnumber" main.go
