#!/usr/bin/env bash
# Rebuild and redeploy the client container with --no-cache.
set -e
cd "$(dirname "$0")/.."
docker compose build --no-cache client && docker compose up -d client
