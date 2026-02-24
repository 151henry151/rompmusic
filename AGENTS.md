# AGENTS.md

## Cursor Cloud specific instructions

### Overview

RompMusic is a libre, self-hosted music streaming platform (monorepo with 3 submodules):

| Service | Tech | Dev Port | Start Command |
|---|---|---|---|
| **rompmusic-server** | Python 3.11+ / FastAPI / Uvicorn | 8080 | `cd rompmusic-server && source venv/bin/activate && uvicorn rompmusic_server.main:app --reload` |
| **rompmusic-client** | React Native / Expo 54 (web) | 3003 | `cd rompmusic-client && npx expo start --web --port 3003 --non-interactive` |
| **rompmusic-website** | Next.js 14 | 3002 | `cd rompmusic-website && npx next dev --port 3002` |
| **PostgreSQL 16** | Database | 5432 | `sudo pg_ctlcluster 16 main start` |
| **Redis 7** | Cache | 6379 | `sudo redis-server --daemonize yes` |

### Starting services

1. Start PostgreSQL and Redis first (`sudo pg_ctlcluster 16 main start && sudo redis-server --daemonize yes`).
2. Start the server from `rompmusic-server/` with its virtualenv activated.
3. Start the client and/or website as needed.

### Non-obvious caveats

- The admin web panel is at `/server` (not `/admin`). Login at `http://localhost:8080/server`.
- The server `.env` must set `MUSIC_PATH` to a directory with audio files for library scanning to work. The default dev config uses `/workspace/music`.
- The server auto-creates database tables on startup via `init_db()` — no manual migration step is needed.
- The client's `EXPO_PUBLIC_API_URL` in `rompmusic-client/.env` must point to the running server (e.g. `http://localhost:8080/api/v1`).
- Server tests (pytest) have pre-existing failures in 2 of 5 tests due to asyncio event loop issues with asyncpg and pytest-asyncio — this is not a setup problem.
- The server uses `package-lock.json` (npm) for both client and website — use `npm install`, not pnpm/yarn.
- The Python virtualenv for the server is at `rompmusic-server/venv/`. Always activate it before running server commands.
- To create an admin user for development, use: `cd rompmusic-server && source venv/bin/activate && python -m rompmusic_server.scripts.create_admin` (interactive prompts).
- The DB user/password defaults to `rompmusic/rompmusic` on `localhost:5432`, database `rompmusic`.

### Lint and test commands

- **Server lint:** `cd rompmusic-server && source venv/bin/activate && ruff check .`
- **Server tests:** `cd rompmusic-server && source venv/bin/activate && pytest tests/ -v`
- **Website lint:** `cd rompmusic-website && npx next lint`
- **Client:** No lint/test scripts configured in package.json; TypeScript checking via `npx tsc --noEmit`.
