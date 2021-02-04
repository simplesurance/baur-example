#!/usr/bin/env bash

set -eux -o pipefail

DOCKER_IMG="golang:1.15.7-alpine@sha256:18100456495c42bcdccab3411d8cfd56f3fdaa8527dd2b5a83800f96c7074a41"
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
elif [ "$1" = "test" ]; then
	docker run --rm --init -e HOME=/tmp/ --user="$(id -u):$(id -g)" \
		   -v "$SCRIPT_DIR":/code -w /code  \
		   $DOCKER_IMG \
		   go test ./...
fi
