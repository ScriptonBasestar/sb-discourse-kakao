# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- CHANGELOG.md for version tracking

## [0.2.0] - 2025-09-26

### Added
- Bundled Kakao OmniAuth strategy inline (no external gem dependency)
- Comprehensive README documentation with troubleshooting guide
- Korean descriptions for all settings

### Fixed
- Validator loading order issue
- Package.json dependency modernization (eslint 9.22.0, prettier 3.5.3)

### Changed
- Updated dependencies to latest versions

## [0.1.0] - 2025-05-27

### Added
- Initial release
- Basic OAuth2 authentication with Kakao
- Multi-language support (40+ locales)
- Site settings configuration
- Validator for required credentials
- Profile information sync (email, nickname, image)
- after_authenticate() method for user info mapping

### Features
- OAuth 2.0 integration with Kakao Login API
- Automatic user creation and profile sync
- Flexible configuration options
- Discourse 3.1.x - 3.5.x compatibility

[Unreleased]: https://github.com/scriptonbasestar/sb-discourse-kakao/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/scriptonbasestar/sb-discourse-kakao/compare/v0.1.0...v0.2.0
[0.1.0]: https://github.com/scriptonbasestar/sb-discourse-kakao/releases/tag/v0.1.0
