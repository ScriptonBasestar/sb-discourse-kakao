# Tech Stack - sb-discourse-kakao

## Overview

| Item | Value |
|------|-------|
| Plugin Version | 0.2.0 |
| Discourse Compatibility | 3.1.999 ~ 3.5.0.beta1-dev |
| Required Discourse | 3.1+ |
| Type | OAuth Authentication Plugin |

---

## Backend (Ruby)

| Component | Version/Value |
|-----------|---------------|
| Ruby | 3.3.x (Discourse default) |
| Gemfile | rubocop-discourse, syntax_tree |
| External Gems | None |
| Engine Pattern | No |
| Service Pattern | No |
| Logging Module | **No** |

### Directory Structure

```
config/
├── settings.yml   # Site settings
├── locales/       # 98 locale files (49 languages)
lib/
├── auth/          # Authenticator
│   └── login_with_kakao_authenticator.rb
├── omniauth/      # OmniAuth strategy
│   └── strategies/kakao.rb
├── validators/    # Setting validators
assets/
├── images/        # Kakao icons
```

---

## Frontend (JavaScript/Ember.js)

| Component | Version/Value |
|-----------|---------------|
| Node.js | >= 22 |
| Package Manager | pnpm 9.x (pnpm@9.15.5) |
| Ember.js | Discourse default |

### Dev Dependencies

| Package | Version |
|---------|---------|
| @discourse/lint-configs | 2.11.1 |
| ember-template-lint | 7.0.1 |
| eslint | 9.22.0 |
| prettier | 3.5.3 |
| stylelint | 16.16.0 |

### ESLint Configuration

- Type: **Flat config (ESM)** - `eslint.config.mjs`
- Base: Minimal (empty default export)
- Custom Rules: No

---

## Internationalization (i18n)

| Item | Value |
|------|-------|
| Total Locale Files | 98 |
| Supported Languages | 49 |
| Primary Languages | ko, en |

---

## Testing

| Component | Tool |
|-----------|------|
| Ruby Tests | RSpec (`spec/`) - **Empty** |

---

## Admin Interface

| Item | Value |
|------|-------|
| Admin Route | None (uses site settings) |
| Pattern | N/A |

---

## Special Features

- Kakao OAuth login integration
- Custom SVG icon registration
- OmniAuth strategy implementation
- Setting validators

---

## Extra Files (Not in other plugins)

| File | Purpose |
|------|---------|
| LICENSE | MIT license |
| CHANGELOG.md | Version history |
| CONTRIBUTING.md | Contribution guide |
| .cursorrules | Cursor IDE rules |
| translator.yml | Translation config |

---

## Differences from gorisa-* Plugins

| Item | This Plugin | gorisa-* |
|------|-------------|----------|
| Type | OAuth plugin | Feature plugin |
| Engine | No | Yes |
| Models | No | Yes |
| Controllers | No | Yes |
| Admin UI | No | Yes |
| after_initialize | No | Yes |
| Logging Module | No | Yes (some) |
