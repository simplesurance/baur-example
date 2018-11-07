#!/usr/bin/env bash

set -eu -o pipefail

DOCKER_PORT=5433

if ! command -v; then
	echo "docker is not installed"
	exit 1
fi

docker run -d -p $DOCKER_PORT:5432 -e POSTGRES_DB=baur postgres:latest
echo "Started docker PostgreSQL container on port $DOCKER_PORT"

echo "Run 'baur init db' to initialize the database for baur"
