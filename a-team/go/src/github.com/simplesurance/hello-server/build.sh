#!/usr/bin/env bash

set -eux -o pipefail

DOCKER_IMG="golang@sha256:e7462ca504afc789d289f2bb5fd471815cc11833439d2fe4e61915b190045359"

REPO_ROOT="$(git rev-parse --show-toplevel)"
TEAM_GO_PATH="$REPO_ROOT/a-team/go"
APP_REL_DIR="${PWD##$TEAM_GO_PATH/}"

docker run --rm --init -e HOME=/tmp/ --user="$(id -u):$(id -g)" \
           -v "$TEAM_GO_PATH":/code -w /code  \
	   -e GOPATH=/code/ \
	   $DOCKER_IMG \
           go build -o "$APP_REL_DIR/dist/hello-server" github.com/simplesurance/hello-server/
