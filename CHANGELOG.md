# Changelog

All notable changes to RompMusic will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

- (Changes since last release will be listed here)

## [0.1.0-beta.10] - 2026-02-16

### Changed

- **Client (0.1.0-beta.9)** — Web: URL always includes base path (/app/...) so reload keeps you in the app. iOS Safari: playTrack and Play handlers adjusted so user gesture is preserved and playback is not blocked.

## [0.1.0-beta.8] - 2026-02-23

### Added

- **Client** — Random album sort option in Library; pull-to-refresh on Library (Artists and Albums tabs).

### Changed

- **Client** — Search results (Library search bar and Search screen) use the same album grouping as the Library albums tab: groupAlbumsByArtwork so e.g. “Doo-Bop” shows as one album instead of three editions. Navigate to AlbumDetail with albumIds for merged view. Edition suffix patterns extended (CD, Vinyl, LP, etc.) so more multi-edition albums show as single release. “Play album” guarded so only one playback starts even if multiple handlers fire.

## [0.1.0-beta.7] - 2026-02-23

### Added

- **Website** — Documentation expanded: new Overview page (why RompMusic, components), Client app setup guide (web app, first-run server URL on Android/iOS, changing server URL, hosting the web client, env vars), and Contributing page (code of conduct, bugs, features, code contributions, repo structure). Docs landing page lists all four sections with descriptions. Install guide links to Client app setup for connecting the client.

### Changed

- **Client** — Merged albums (e.g. Doo-Bop): when opening a grouped album, navigation passes both albumId and albumIds so the URL is stable (/album/3143) and state has the full edition list; deep link parses albumIds query param. Merged tracks by (disc_number, track_number) only so the full track list shows across editions without duplicate track ids. Server URL: first-run "Connect to your server" when no URL and no EXPO_PUBLIC_API_URL; Settings has Server URL with edit dialog (change clears session). Play album: only one track plays; pause stops the single active player.
- **Client** — Player store tracks all active AudioPlayer instances in a set; playTrack calls stopAndRemoveAllPlayers() before starting so no orphaned players keep playing. Teardown uses pause() then remove() and removePlayer() for consistent cleanup.

## [0.1.0-beta.6] - 2026-02-19

### Added

- **Client (0.1.0-beta.6)** — Cookie-based play history when not signed in; play history icon in Library when logged out; album share with in-app “Link copied!” feedback; track share in three-dots menu; direct album URL handling via custom `getStateFromPath`. No-artwork placeholder shows “no album art” text; multiple-editions UI (per-edition sections, Play album / Add to queue / Play next); track dedupe by id and (album_id, disc, track_number); library initial page size 80; loading state until playback starts; Safari uses original format (no OGG). Play history empty message fix.
- **Website (0.1.0-beta.3)** — Redirect `/album/:id` to `/app/album/:id` for shared album links.

### Changed

- **Server (0.1.0-beta.5)** — Artwork: commit album artwork clear before raising 404 so DB updates persist. Streaming: logging, top-level try/except, `FileResponse(str(full_path))`, `track.file_path` check, OSError handling. Library: fix N+1 in list_albums (one query for all track counts by album id).

## [0.1.0-beta.5] - 2026-02-18

### Added

- **Client** — Album grouping by identical artwork: albums with the same cover image appear as one card; tap to open and see each version (disc/edition) as separate sections with full titles. When artwork hash is not yet available, grouping falls back to primary artist + title + year (collaboration variants and same-title multi-artist albums like "Amy" merge). Track share button and deep links (`/track/:id`).

### Changed

- **Client** — Albums with no artwork (or showing placeholder) are sorted to the end of the album list and to the end of each A–Z letter and decade section. Sort uses "shows real artwork" so placeholder cards stay at the bottom.
- **Server** — Artwork hash on albums for client grouping; stored when artwork is served or during scan. Default `AUTO_SCAN_INTERVAL_HOURS` and `BEETS_AUTO_INTERVAL_HOURS` set to 24 (daily).
- **Website** — Redundant "Open App" links removed from landing, ToS, and Privacy headers (kept single "Launch Web App" button).

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

[Unreleased]: https://github.com/151henry151/rompmusic/compare/v0.1.0-beta.8...HEAD
[0.1.0-beta.8]: https://github.com/151henry151/rompmusic/compare/v0.1.0-beta.7...v0.1.0-beta.8
[0.1.0-beta.7]: https://github.com/151henry151/rompmusic/compare/v0.1.0-beta.6...v0.1.0-beta.7
[0.1.0-beta.6]: https://github.com/151henry151/rompmusic/compare/v0.1.0-beta.5...v0.1.0-beta.6
[0.1.0-beta.5]: https://github.com/151henry151/rompmusic/compare/v0.1.0-beta.4...v0.1.0-beta.5
[0.1.0-beta.4]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.4
[0.1.0-beta.3]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.3
[0.1.0-beta.2]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.2
[0.1.0-beta.1]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.1
