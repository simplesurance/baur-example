#!/usr/bin/env bash

set -eux -o pipefail

DOCKER_IMG="golang@sha256:e7462ca504afc789d289f2bb5fd471815cc11833439d2fe4e61915b190045359"
SCRIPT_DIR="$(cd "$(dirname "$0")" ; pwd -P)"

docker run --rm --init -e HOME=/tmp/ --user="$(id -u):$(id -g)" \
           -v "$SCRIPT_DIR":/code -w /code  \
	   $DOCKER_IMG \
           go build -mod=vendor -o "dist/randomnumber" main.go
