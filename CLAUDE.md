# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

**sb-discourse-kakao**: Discourse plugin for Kakao OAuth login integration.

| Item | Value |
|------|-------|
| Features | Kakao OAuth2 login |
| Languages | 48+ locales (full i18n support) |
| Auth Provider | `auth_provider authenticator: ... icon: "kakao"` |

---

## Quick Commands

```bash
# Tests (from Discourse directory)
bundle exec rspec plugins/sb-discourse-kakao/spec/

# Linting
bundle exec rubocop plugins/sb-discourse-kakao/
```

---

## Architecture

### OAuth2 Flow

```
User clicks "Login with Kakao"
→ Redirect to kauth.kakao.com/oauth/authorize
→ User authorizes on Kakao
→ Callback to /auth/kakao/callback
→ Exchange code for token at kauth.kakao.com/oauth/token
→ Fetch user info from kapi.kakao.com/v2/user/me
→ Create/update Discourse user
```

### Core Components

| Component | Location | Purpose |
|-----------|----------|---------|
| `OmniAuth::Strategies::Kakao` | lib/omniauth/strategies/kakao.rb | OAuth2 strategy |
| `Auth::LoginWithKakaoAuthenticator` | lib/auth/login_with_kakao_authenticator.rb | Discourse authenticator |
| `EnableLoginWithKakaoValidator` | lib/validators/ | Settings validator |

### OmniAuth Strategy

```ruby
# Kakao API endpoints
BASE_URL = "https://kauth.kakao.com"
USER_INFO_URL = "https://kapi.kakao.com/v2/user/me"

# User info mapping
uid: raw_info["id"]
name: properties["nickname"]
email: kakao_account["email"]  # Requires business app approval
image: properties["thumbnail_image"]
```

---

## Key Settings

```yaml
# Core
enable_login_with_kakao: false          # Enable/disable (default: off)

# OAuth Credentials (secret)
login_with_kakao_client_id: ""          # REST API Key from Kakao Developers
login_with_kakao_client_secret: ""      # Client Secret

# Scope
login_with_kakao_scope: "profile_nickname,profile_image,account_email"
# Note: account_email requires Kakao business app approval

# Callback
login_with_kakao_redirect_url: ""       # Full URL (takes priority)
login_with_kakao_redirect_path: "/auth/kakao/callback"  # Path only

# Email handling
login_with_kakao_overrides_email: false # Override existing user email
login_with_kakao_email_verified: true   # Trust Kakao's email verification
```

---

## Directory Structure

```
sb-discourse-kakao/
├── plugin.rb                    # Entry, auth_provider registration
├── config/
│   ├── settings.yml             # Site settings
│   └── locales/                 # 48+ language files
├── lib/
│   ├── omniauth/strategies/
│   │   └── kakao.rb             # OmniAuth OAuth2 strategy
│   ├── auth/
│   │   └── login_with_kakao_authenticator.rb
│   └── validators/
│       └── enable_login_with_kakao_validator.rb
└── assets/images/
    └── kakao.svg                # Kakao icon
```

---

## Kakao Developer Setup

1. Go to https://developers.kakao.com/
2. Create application
3. Enable Kakao Login
4. Add redirect URI: `https://your-site.com/auth/kakao/callback`
5. Get REST API Key (client_id) and Client Secret
6. For email access: Apply for business app approval

### Required Scopes

| Scope | Description | Requirements |
|-------|-------------|--------------|
| `profile_nickname` | User nickname | Default |
| `profile_image` | Profile image | Default |
| `account_email` | Email address | Business app approval |

---

## Testing

```bash
# Test OAuth flow manually
# 1. Enable plugin in admin settings
# 2. Configure client_id and client_secret
# 3. Visit /login and click Kakao button
# 4. Check rails logs for auth flow
```

---

## Common Issues

### Email Not Available
- Kakao requires business app approval for email access
- Without approval, users created without email
- Solution: Apply for business app status on Kakao Developers

### Callback URL Mismatch
- Ensure redirect URL matches Kakao Developer Console exactly
- Use `login_with_kakao_redirect_url` for full URL control

---

## Rules

- Store OAuth secrets securely (secret: true in settings.yml)
- Support full i18n (48+ locales maintained)
- Handle missing email gracefully (business app approval required)
- Use `ManagedAuthenticator` base class for standard behavior
- Register SVG icon for login button display
