#!/usr/bin/env bash
# Rebuild and redeploy the server container (no --no-cache).
set -e
cd "$(dirname "$0")/.."
docker compose build server && docker compose up -d server
