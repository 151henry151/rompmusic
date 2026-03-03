# Changelog

All notable changes to RompMusic will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Fixed

- Client: Album playback advances to next track reliably at end of track (wider end threshold + fallback timer)
- Client: Play album on Android — second track no longer plays first track’s audio (load next track fresh instead of reusing preloaded player)

### Added

- (Changes since last release will be listed here)

## [0.1.4] - 2026-02-14

### Fixed

- Client: "Play album" crash ("undefined is not a function") fixed; fallback to single-track path when native setQueue unavailable; setQueue now uses JSON string for bridge compatibility.

## [0.1.3] - 2026-02-14

### Added

- Client (Android): native ExoPlayer queue so next track plays when current ends even when device is locked or app is in background

### Fixed

- Client: playback no longer stops after first track when device is idle or screen off (native queue advances in background)

## [0.1.1] - 2026-02-14

### Fixed

- Client: next track starts when device is locked or screen off (background playback + time-based advance + catch-up on resume)

### Added

- Client: expo-audio background playback plugin, WAKE_LOCK, AppState-based queue advance on app resume

## [0.1.0] - 2026-02-14

First stable release. Dropped beta designation for Google Play Store submission.

### Changed

- Version set to 0.1.0 across all components (client, server, website)

## [0.1.0-beta.17] - 2026-03-01

### Fixed

- Client: Album details page not loading (use RefreshControl directly instead of DismissRefreshControl wrapper; safe route.params)
- Client: Random sort keeps 3 albums per row (use same effective grid width as section-index view so card size and column count match)

## [0.1.0-beta.16] - 2026-02-16

### Fixed

- Client: Album details screen black on Android (SwipeDownDismissWrapper layout; use outer View + absolute Animated.View so content renders)
- Client: Random sort now keeps 3 albums per row (set albumsPerRow when selecting Random in sort menu)

### Changed

- Client: Full-page player close control is back arrow top-left (matches album/track detail)
- Client: Swipe-down to dismiss animates (drag page down to reveal previous screen, then dismiss)
- Client: Dismiss gesture no longer shows refresh spinner (DismissRefreshControl with transparent indicator)
- Client: Prefetch first 20 album artwork URLs when library loads for faster grid display

## [0.1.0-beta.15] - 2026-03-16

### Changed

- Client: swipe-down to dismiss on album detail, track detail, and full-page player (pull down at top = go back/close, same gesture as library refresh)

## [0.1.0-beta.14] - 2026-03-01

### Added

- Client: EAS Build for Android (APK), local keystore/credentials, preview profile
- Client: HomeScreen, AppErrorBoundary, ngrok tunnel config and scripts
- Client: expo-asset for SDK 54 compatibility; zoomable artwork modal; expo-audio patch

### Fixed

- Client: App crash on launch (PaperProvider theme; use MD3DarkTheme)
- Client: react-native-screens aligned to ~4.16.0 for Expo SDK 54
- Client: Adaptive icon and app icon made square (246×246) for store requirements

### Changed

- Client: Build and run scripts (build-apk.sh, tunnel env); player swipe-down dismiss and media controls; album/library/player UI improvements

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

[Unreleased]: https://github.com/151henry151/rompmusic/compare/v0.1.4...HEAD
[0.1.4]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.4
[0.1.3]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.3
[0.1.1]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.1
[0.1.0]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0
[0.1.0-beta.17]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.17
[0.1.0-beta.16]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.16
[0.1.0-beta.15]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.15
[0.1.0-beta.14]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.14
[0.1.0-beta.1]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.1
