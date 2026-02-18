# Changelog

All notable changes to RompMusic will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- (Changes since last release will be listed here)

## [0.1.0-beta.4] - 2026-02-16

### Added

- **Server** — Resend welcome email from admin dashboard (per user; includes username and login link).
- **Server** — Logo and favicon in admin UI.

### Changed

- **Server** — Invite flow: admin sets only username (password defaults to username); invite email and dashboard form updated; "Resend welcome email" button in Users table.

## [0.1.0-beta.3] - 2026-02-17

### Added

- **Client** — Play history screen (recently played tracks); History in app nav; clock icon in Library when signed in.
- **Client** — Search suggestions as you type in Library (debounced; artists, albums, tracks with tap-to-open).
- **Client** — Setting “Put albums with artwork first” (albums without art at bottom); optional in Settings.
- **Server** — Optional automated library scan: set `AUTO_SCAN_INTERVAL_HOURS` (e.g. 24 for daily).
- **Server** — Optional Beets automation: set `BEETS_AUTO_INTERVAL_HOURS` (e.g. 24) to run `beet fetch-art` in the music directory.

### Changed

- **Client** — Library lists (artists, albums, songs) are paginated (50 per page, “Load more”) to avoid crashes on large libraries.
- **Client** — Mini player shows album name (artist • album); queue panel shows full queue with current track highlighted; artist and album are tappable (open artist/album screen).
- **Client** — Artist and album names are tappable everywhere (Track detail, Player, Library songs, Search, Album detail) and open the corresponding screen.
- **Client** — Gapless: prestart next track 15 s before end; seek to 0 on promote; current track uses streaming (no download-first) for faster start.
- **Server** — Library scan runs in a background task with its own DB session; progress is streamed via SSE. Closing the admin tab no longer cancels the scan.
- **Server** — Album search matches artist name and any track title on the album (not only album title).
- **Server** — Album tracks are ordered by disc number then track number when requested by album (correct multi-disc order).
- **Server** — List albums supports `artwork_first` (default true) to put albums with artwork first.
- **Server** — Dashboard shows scan error message when a scan fails instead of reloading.

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

[Unreleased]: https://github.com/151henry151/rompmusic/compare/v0.1.0-beta.4...HEAD
[0.1.0-beta.4]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.4
[0.1.0-beta.3]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.3
[0.1.0-beta.2]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.2
[0.1.0-beta.1]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.1
