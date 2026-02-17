# RompMusic

**Libre and gratis music streaming — your music, your server, your freedom.**

[![GPL-3.0 License](https://img.shields.io/badge/License-GPL--3.0-blue.svg)](LICENSE)

RompMusic is a complete, self-hosted music streaming system that is **libre** (free as in freedom) and **gratis** (free as in beer). You own your music, control your data, and run the software on your own hardware—with no tracking, no proprietary services, and no compromises on user freedom.

## Why RompMusic?

- **Libre Software** — Licensed under GPL-3.0. Use, study, modify, and share freely
- **Gratis** — No subscription fees, no paywalls, no proprietary lock-in
- **Self-Hosted** — Your music stays on your server. Complete privacy and control
- **Cross-Platform** — One beautiful app on Android, iOS, and web
- **Gapless Playback** — Albums play seamlessly with no gaps between tracks
- **No Tracking** — Zero telemetry, analytics, or surveillance

## Components

| Component | Description |
|-----------|-------------|
| **rompmusic-server** | Backend server for streaming, library management, and API |
| **rompmusic-client** | Cross-platform client (Android, iOS, web) with gapless playback, play history, and paginated library |
| **rompmusic-website** | Project website and documentation at rompmusic.com |

## Quick Start

### Using Docker (Recommended)

```bash
git clone --recursive https://github.com/rompmusic/rompmusic.git
cd rompmusic
cp .env.example .env
# Edit .env with your configuration
docker compose up -d
```

### Manual Installation

See the [Installation Guide](https://rompmusic.com/docs/install) for detailed instructions.

## Documentation

- [Installation](https://rompmusic.com/docs/install)
- [Configuration](https://rompmusic.com/docs/configuration)
- [Self-Hosting Guide](https://rompmusic.com/docs/self-hosting)
- [Contributing](CONTRIBUTING.md)

## License

RompMusic is free software: you can redistribute it and/or modify it under the terms of the **GNU General Public License v3.0** (GPL-3.0). See [LICENSE](LICENSE) for the full license text.

This guarantees you the four freedoms:
1. **Use** the software for any purpose
2. **Study** how it works and modify it
3. **Redistribute** copies
4. **Distribute** modified versions

## Contributing

We welcome contributions! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## Links

- **Website**: [rompmusic.com](https://rompmusic.com)
- **Web App**: [rompmusic.com/app](https://rompmusic.com/app)
- **Server Admin**: [rompmusic.com/server](https://rompmusic.com/server)

---

*RompMusic — Music streaming that respects your freedom.*
