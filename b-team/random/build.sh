#!/usr/bin/env bash

set -eux -o pipefail

DOCKER_IMG="golang@sha256:2de21f4fe5c3557c31b716291a7986c0d54abbd282cd7fb43aaa484672b0c855"
SCRIPT_DIR="$(cd "$(dirname "$0")" ; pwd -P)"

if [ $# -ne 1 ]; then
	echo "usage: $0 check|build"
	exit 1
fi

if [ "$1" = "build" ]; then
	docker run --rm --init -e HOME=/tmp/ --user="$(id -u):$(id -g)" \
		   -v "$SCRIPT_DIR":/code -w /code  \
		   $DOCKER_IMG \
		   go build -o "dist/randomnumber" main.go
elif [ "$1" = "check" ]; then
	docker run --rm --init -e HOME=/tmp/ --user="$(id -u):$(id -g)" \
		   -v "$SCRIPT_DIR":/code -w /code  \
		   $DOCKER_IMG \
		   go vet ./...
fi

