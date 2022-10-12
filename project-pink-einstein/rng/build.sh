#!/usr/bin/env bash

set -eux -o pipefail

DOCKER_IMG="golang:1.16.2-alpine@sha256:4891e17c9d2de88ebd1d9421919539226a76773d6ad1b4ac7376b286039c9be2"
SCRIPT_DIR="$(cd "$(dirname "$0")" ; pwd -P)"

if [ $# -ne 1 ]; then
	echo "usage: $0 check|build"
	exit 1
fi

RNG_VERSION="${RNG_VERSION:-unset}"

if [ "$1" = "build" ]; then
	docker run --rm --init -e HOME=/tmp/ --user="$(id -u):$(id -g)" \
		   -v "$SCRIPT_DIR":/code -w /code  \
		   $DOCKER_IMG \
		   go build -ldflags="-X main.Version=$RNG_VERSION" -o "dist/randomnumber" main.go
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
