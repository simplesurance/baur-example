#!/usr/bin/env bash

set -eux -o pipefail

DOCKER_IMG="golang@sha256:e8e4c4406217b415c506815d38e3f8ac6e05d0121b19f686c5af7eaadf96f081"

REPO_ROOT="$(git rev-parse --show-toplevel)"
TEAM_GO_PATH="$REPO_ROOT/a-team/go"
APP_REL_DIR="${PWD##$TEAM_GO_PATH/}"

docker run --rm --init -e HOME=/tmp/ --user="$(id -u):$(id -g)" \
           -v "$TEAM_GO_PATH":/code -w /code  \
	   -e GOPATH=/code/ \
	   $DOCKER_IMG \
           go build -o "$APP_REL_DIR/dist/hello-server" github.com/simplesurance/hello-server/
