#!/usr/bin/env bash
# Rebuild and redeploy website, client, and server with --no-cache.
set -e
cd "$(dirname "$0")/.."
docker compose build --no-cache website client server && docker compose up -d website client server
