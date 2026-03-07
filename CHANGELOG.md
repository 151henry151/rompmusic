# Changelog

All notable changes to RompMusic will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- (Changes since last release will be listed here)

### Changed

- Update `rompmusic-client` submodule reference to include Android production-build metadata increment (`expo.android.versionCode` `5` -> `6`).
- Update `rompmusic-client` submodule reference to include Android production-build metadata increment (`expo.android.versionCode` `6` -> `7`).
- Update `rompmusic-client` submodule reference to exclude `react-native-track-player` from Expo Doctor React Native Directory validation for intentional non-New-Architecture usage.

## [0.1.9] - 2026-03-06

### Changed

- Synchronize umbrella version metadata and component submodule references to `0.1.9`.
- Update `rompmusic-client` submodule reference to include Android production-build metadata increment (`expo.android.versionCode` `4` -> `5`).
- Update `rompmusic-client` submodule reference to disable New Architecture for Android runtime compatibility with `react-native-track-player`.
- Update `rompmusic-server` submodule reference to include `0.1.9` version-metadata updates.
- Update `rompmusic-website` submodule reference to include `0.1.9` version-metadata updates.

### Fixed

- Client: Add Android playback-service recovery handlers that retry playback errors and force queue progression when playback reports `Ended` before advancing to the next track.

## [0.1.8] - 2026-03-06

### Changed

- Synchronize umbrella version metadata and component submodule references to `0.1.8`.
- Update `rompmusic-client` submodule reference to include Android native TrackPlayer queue-service playback architecture.
- Update `rompmusic-server` submodule reference to include `0.1.8` version-metadata updates.
- Update `rompmusic-website` submodule reference to include `0.1.8` version-metadata updates.

### Fixed

- Client: Delegate Android lock-screen/background queue transitions to the native playback service path.
- Client: Synchronize Android player UI state from native playback events and foreground re-sync calls.
- Client: Patch `react-native-track-player` Kotlin nullability handling so Android release builds compile with Expo SDK 54 / React Native 0.81.

## [0.1.7] - 2026-03-06

### Changed

- Synchronize umbrella version metadata and component submodule references to `0.1.7`.
- Client: Add Android mini-player previous/next controls around the play/pause button.
- Client: Trigger AppState background handling only for true `background` transitions and restrict early end-of-track promotion heuristics to background playback.
- Update `rompmusic-client` submodule reference to include Android ExoPlayer wake-mode queue-transition reliability changes.
- Update `rompmusic-client` submodule reference to include live-duration resume guards that suppress false post-unlock skips.
- Update `rompmusic-client` submodule reference to include album-order fallback sorting and Android startup transcoding fallback.

### Fixed

- Client: Sync native queue index/position when Android app returns to foreground from lock/background.
- Client: Limit non-native Android resume catch-up to a single next-track advance to avoid multi-track skips.
- Client: Capture Android background snapshots from live player time/duration and ignore transient `inactive` AppState transitions.
- Client: Avoid foreground track truncation by requiring end-of-track completion events for queue advancement while app is active.
- Client: Skip foreground resume catch-up when playback already advanced to a new track while device was locked.
- Client: Set Android ExoPlayer wake mode to `WAKE_MODE_NETWORK` so queued stream transitions can continue while device is locked.
- Client: Prefer live player duration/status on foreground resume and avoid forced skip while a track is actively playing.
- Client: Sort album tracks using metadata with fallback parsing of leading title numbers when track tags are missing.
- Client: Retry Android playback startup with transcoded OGG when original-format stream remains stuck at `0:00`.

## [0.1.6] - 2026-03-05

### Changed

- Client: Normalize `/search` query text by trimming and collapsing internal whitespace.
- Server: Normalize search input into lowercase tokens before applying filters.
- Synchronize umbrella version metadata and submodule references to `0.1.6`.

### Fixed

- Server: Replace phrase-level `ilike` matching with tokenized case-insensitive matching in `/search` for artists, albums, and tracks.
- Server: Apply tokenized case-insensitive matching to `/library/artists`, `/library/albums`, and `/library/tracks` search filters.

## [0.1.5] - 2026-03-05

### Changed

- Synchronize umbrella release metadata and component version references to `0.1.5`.

### Fixed

- Client: Use effective web stream-format selection and keep Safari on original format when OGG is selected.
- Client: Try JSON-string and array `setQueue` payload signatures in Android native queue setup before fallback.
- Client: Replace malformed `expo-audio+1.1.1` patch payload so native queue bridge methods apply during install.
- Client: Catch lock-screen metadata and native seek bridge errors so Android album playback does not drop to JS-only advancement.

## [0.1.4] - 2026-02-14

### Fixed

- Client: Guard native queue calls by checking `setQueue` availability, fall back to single-track `loadAndPlay`, and serialize queue payloads as JSON for bridge compatibility.

## [0.1.3] - 2026-02-14

### Added

- Client (Android): Integrate native ExoPlayer queue handling in the playback path so the next track is scheduled in background/locked playback.

### Fixed

- Client: Route album playback advancement through the native queue path so playback continues when the device is idle or screen-off.

## [0.1.1] - 2026-02-14

### Fixed

- Client: Add time-threshold track-end detection and AppState resume catch-up logic to trigger next-track starts after lock/background transitions.

### Added

- Client: Enable the expo-audio background playback plugin, add Android `WAKE_LOCK`, and add AppState-based resume queue-advance hooks.

## [0.1.0] - 2026-02-14

First stable release. Dropped beta designation for Google Play Store submission.

### Changed

- Set version `0.1.0` across client, server, and website components.

## [0.1.0-beta.17] - 2026-03-01

### Fixed

- Client: Replace `DismissRefreshControl` wrapper usage with direct `RefreshControl` and guard `route.params` reads in Album details.
- Client: Compute random-sort grid sizing from section-index layout width constants so random mode preserves three columns.

## [0.1.0-beta.16] - 2026-03-01

### Fixed

- Client: Replace `SwipeDownDismissWrapper` layout with outer `View` + absolute `Animated.View` so Album details render on Android.
- Client: Set `albumsPerRow` explicitly when selecting Random sort.

### Changed

- Client: Replace full-page player close control with a top-left back arrow to match album/track detail screens.
- Client: Animate swipe-down dismiss by translating page content with drag distance and threshold-based dismissal.
- Client: Render dismiss refresh control with a transparent indicator to suppress visible spinner artifacts.
- Client: Prefetch the first 20 album artwork URLs when library data loads.

## [0.1.0-beta.15] - 2026-03-01

### Changed

- Client: Add top-of-scroll swipe-down dismiss handlers on album detail, track detail, and full-page player screens.

## [0.1.0-beta.14] - 2026-03-01

### Added

- Client: Add EAS Android APK preview build profile with local keystore/credential support.
- Client: Add `HomeScreen`, `AppErrorBoundary`, and ngrok tunnel configuration/scripts.
- Client: Add `expo-asset` SDK 54 compatibility, zoomable artwork modal support, and expo-audio patch updates.

### Fixed

- Client: Switch PaperProvider theme initialization to `MD3DarkTheme` to avoid startup crash paths.
- Client: Pin `react-native-screens` to Expo SDK 54-compatible `~4.16.0`.
- Client: Replace adaptive and app icon assets with 246×246 square variants for store validation requirements.

### Changed

- Client: Update build/run scripts (`build-apk.sh`, tunnel env), swipe-dismiss/media controls, and album/library/player UI layout.

## [0.1.0-beta.1] - 2025-02-15

First beta release. Considered beta until all components are confirmed working in production.

### Added

- **Server (rompmusic-server)**
  - Build FastAPI backend services with PostgreSQL and Redis.
  - Implement library scanning with Mutagen metadata parsing (MP3, FLAC, M4A, OGG, OGA, Opus).
  - Stream live scan progress over Server-Sent Events (SSE).
  - Add admin dashboard login, library statistics, and scan controls.
  - Emit startup status messages ("Opening music directory", "Discovering files", "Found N files") plus per-file progress.
  - Add JWT authentication and admin-user creation.
  - Expose REST APIs for library, search, streaming, playlists, and artwork.
  - Publish Swagger and ReDoc API docs.
- **Website (rompmusic-website)**
  - Build Next.js 14 landing page at rompmusic.com.
  - Add docs and installation guide pages.
  - Add `/app` and `/server` links for client and admin entry points.
  - Add Dockerfile for standalone production builds.
- **Client (rompmusic-client)**
  - Build Expo app targets for Android, iOS, and web.
  - Add gapless playback support.
- **Deployment**
  - Add Docker Compose stack (server, website, PostgreSQL, Redis).
  - Add nginx configuration for rompmusic.com (SSL and API/server/website proxying).

### Fixed

- Website: Create the `public` directory in Docker builds so Next.js standalone output includes static assets.
- Server: Emit per-file scan progress callbacks and use SSE-friendly nginx proxy settings for continuous scan updates.

[Unreleased]: https://github.com/151henry151/rompmusic/compare/v0.1.9...HEAD
[0.1.9]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.9
[0.1.8]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.8
[0.1.7]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.7
[0.1.6]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.6
[0.1.5]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.5
[0.1.4]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.4
[0.1.3]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.3
[0.1.1]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.1
[0.1.0]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0
[0.1.0-beta.17]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.17
[0.1.0-beta.16]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.16
[0.1.0-beta.15]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.15
[0.1.0-beta.14]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.14
[0.1.0-beta.1]: https://github.com/151henry151/rompmusic/releases/tag/v0.1.0-beta.1
