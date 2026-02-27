#!/usr/bin/env bash
# Rebuild and redeploy the website container (no --no-cache).
set -e
cd "$(dirname "$0")/.."
docker compose build website && docker compose up -d website
