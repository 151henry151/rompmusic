# Contributing to RompMusic

Thank you for your interest in contributing to RompMusic! As a libre software project, we welcome contributions from the community.

## Code of Conduct

- Be respectful and inclusive
- Welcome newcomers
- Focus on constructive feedback

## License

By contributing, you agree that your contributions will be licensed under the **GNU General Public License v3.0** (GPL-3.0). All submitted code must be GPL-compatible.

## How to Contribute

### Reporting Bugs

1. Check if the bug has already been reported in Issues
2. Create a new issue with a clear title and description
3. Include steps to reproduce, expected vs actual behavior
4. Specify your environment (OS, versions)

### Suggesting Features

1. Open an issue with the "enhancement" label
2. Describe the feature and its benefit
3. Consider how it aligns with RompMusic's libre philosophy

### Code Contributions

1. **Fork** the repository
2. **Create a branch**: `git checkout -b feature/your-feature-name`
3. **Make changes** following our coding standards
4. **Add GPL-3.0 headers** to all new source files:
   ```
   # Copyright (C) 2024 RompMusic Contributors
   # SPDX-License-Identifier: GPL-3.0-or-later
   ```
5. **Commit** with clear, descriptive messages
6. **Push** to your fork and open a Pull Request

### Code Standards

- **Server (Python)**: Follow PEP 8, use type hints
- **Client (TypeScript/React)**: ESLint + Prettier
- **Website (Next.js)**: Consistent with existing style

### Critical Requirements

- **Gapless playback**: Any audio-related changes must not break gapless playback
- **No proprietary deps**: Only GPL-compatible dependencies
- **No tracking**: Never add telemetry or analytics

## Repository Structure

```
rompmusic/
├── rompmusic-server/   # FastAPI backend
├── rompmusic-client/   # React Native + Expo client
└── rompmusic-website/  # Next.js project site
```

## Development Setup

See the README in each component for setup instructions.

## Questions?

Open an issue or reach out to the maintainers.

Thank you for helping make RompMusic better for everyone!
