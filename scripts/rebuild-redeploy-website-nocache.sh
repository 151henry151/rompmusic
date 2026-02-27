#!/usr/bin/env bash
# Rebuild and redeploy the website container with --no-cache.
set -e
cd "$(dirname "$0")/.."
docker compose build --no-cache website && docker compose up -d website
