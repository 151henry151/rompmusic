# Changelog

All notable changes to RompMusic will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- (Changes since last release will be listed here)

## [0.1.0-beta.2] - 2026-02-16

### Changed

- **Client (rompmusic-client)** — Gapless playback: prestart next track at zero volume ~400 ms before end; at ~20 ms promote and unmute. Reset prestart state in all code paths. Mini player: queue chevron in centered row above progress bar (removed from full-screen player).

### Fixed

- **Client (rompmusic-client)** — Queue / "play next" bug: choosing "play next" on another song while an album was playing could play the wrong track; fixed by clearing preload and preloading the new next track when queue changes.

## [0.1.0-beta.1] - 2025-02-15

First beta release. Considered beta until all components are confirmed working in production.

### Added

- **Server (rompmusic-server)**
  - FastAPI backend with PostgreSQL and Redis
  - Library scanner with Mutagen for metadata (MP3, FLAC, M4A, OGG, OGA, Opus)
  - Server-Sent Events (SSE) stream for live scan progress
  - Admin dashboard with login, library statistics, and scan UI
  - Live startup status messages: "Opening music directory", "Discovering files", "Found N files", per-file progress
  - JWT authentication and admin user creation
  - REST API for library, search, streaming, playlists, artwork
  - Swagger and ReDoc API documentation
- **Website (rompmusic-website)**
  - Next.js 14 landing page at rompmusic.com
  - Docs and installation guide
  - /app and /server links for client and admin
  - Dockerfile for standalone production build
- **Client (rompmusic-client)**
  - Expo app for Android, iOS, and web
  - Gapless playback support
- **Deployment**
  - Docker Compose stack (server, website, PostgreSQL, Redis)
  - Nginx configuration for rompmusic.com (SSL, proxy to API/server/website)

### Fixed

- Website Docker build (create `public` directory for Next.js standalone)
- Library scan progress stuck at 0% (per-file progress callbacks, SSE-friendly nginx config)

[Unreleased]: https://github.com/151henry151/rompmusic/compare/v0.1.0-beta.2...HEAD
[0.1.0-beta.2]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.2
[0.1.0-beta.1]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.1
