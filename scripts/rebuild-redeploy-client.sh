#!/usr/bin/env bash
# Rebuild and redeploy the client container (no --no-cache).
set -e
cd "$(dirname "$0")/.."
docker compose build client && docker compose up -d client
