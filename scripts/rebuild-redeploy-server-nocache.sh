#!/usr/bin/env bash
# Rebuild and redeploy the server container with --no-cache.
set -e
cd "$(dirname "$0")/.."
docker compose build --no-cache server && docker compose up -d server
