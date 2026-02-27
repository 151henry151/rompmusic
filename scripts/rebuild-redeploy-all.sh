#!/usr/bin/env bash
# Rebuild and redeploy website, client, and server (no --no-cache).
set -e
cd "$(dirname "$0")/.."
docker compose build website client server && docker compose up -d website client server
