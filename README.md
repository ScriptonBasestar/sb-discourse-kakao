# Login with Kakao Plugin for Discourse / Discourse 카카오 로그인 플러그인

[![Discourse Version](https://img.shields.io/badge/discourse-3.1.999%2B-blue.svg)](https://www.discourse.org/)
[![Plugin Version](https://img.shields.io/badge/version-0.1.0-green.svg)](https://github.com/scriptonbasestar/sb-discourse-kakao)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

A Discourse plugin that enables authentication via Kakao Login (OAuth 2.0) for Korean users.

Discourse에서 카카오 로그인(OAuth 2.0)을 통한 인증을 가능하게 하는 플러그인입니다.

## 🌟 Features / 주요 기능

### English
- **OAuth 2.0 Integration**: Secure authentication via Kakao Login API
- **Auto User Creation**: Automatically create user accounts from Kakao profile data
- **Profile Sync**: Sync profile pictures and nicknames from Kakao
- **Flexible Configuration**: Configurable OAuth scopes and redirect URLs
- **Multilingual Support**: Full Korean and English locale support
- **Discourse 3.1.999+ Compatible**: Supports latest Discourse versions up to 3.5.0

### 한국어
- **OAuth 2.0 연동**: 카카오 로그인 API를 통한 안전한 인증
- **자동 계정 생성**: 카카오 프로필 정보로 사용자 계정 자동 생성
- **프로필 동기화**: 카카오의 프로필 사진과 닉네임 동기화
- **유연한 설정**: OAuth 스코프 및 리디렉션 URL 설정 가능
- **다국어 지원**: 완전한 한국어 및 영어 로케일 지원
- **Discourse 3.1.999+ 호환**: 최신 Discourse 3.5.0 버전까지 지원

## 📋 Requirements / 시스템 요구사항

### English
- Discourse 3.1.999 or higher
- Ruby 3.0+ (matching your Discourse installation)
- Valid Kakao Developers account and registered application
- SSL/HTTPS enabled domain (required by Kakao OAuth)

### 한국어
- Discourse 3.1.999 이상
- Ruby 3.0+ (Discourse 설치 버전과 일치)
- 유효한 카카오 개발자 계정 및 등록된 앱
- SSL/HTTPS가 활성화된 도메인 (카카오 OAuth 필수 요구사항)

## 🚀 Installation / 설치 방법

### English

#### 1. Add Plugin to Discourse

Add the following line to your `app.yml` file in the `hooks.after_code` section:

```yaml
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - git clone https://github.com/scriptonbasestar/sb-discourse-kakao.git
```

#### 2. Rebuild Discourse

```bash
cd /var/discourse
./launcher rebuild app
```

### 한국어

#### 1. Discourse에 플러그인 추가

`app.yml` 파일의 `hooks.after_code` 섹션에 다음 줄을 추가합니다:

```yaml
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - git clone https://github.com/scriptonbasestar/sb-discourse-kakao.git
```

#### 2. Discourse 재빌드

```bash
cd /var/discourse
./launcher rebuild app
```

## ⚙️ Kakao Developers Configuration / 카카오 개발자센터 설정

### English

#### 1. Create Kakao Application

1. Visit [Kakao Developers](https://developers.kakao.com/)
2. Sign in with your Kakao account
3. Click "내 애플리케이션" (My Applications) → "애플리케이션 추가하기" (Add Application)
4. Fill in application details:
   - **App Name**: Your Discourse site name
   - **Company**: Your organization name

#### 2. Configure OAuth Settings

1. Go to your application dashboard
2. Navigate to "제품 설정" (Product Settings) → "카카오 로그인" (Kakao Login)
3. Enable "카카오 로그인 활성화 설정" (Activate Kakao Login)
4. Set **Redirect URI**: `https://yourdiscourse.com/auth/kakao/callback`
5. Configure scopes in "동의항목" (Consent Items):
   - ✅ **profile_nickname** (Required)
   - ✅ **profile_image** (Recommended)
   - ✅ **account_email** (Optional - requires business verification)

#### 3. Get Application Keys

1. Go to "앱 설정" (App Settings) → "앱 키" (App Keys)
2. Copy the following:
   - **REST API 키** (REST API Key) → Use as Client ID
   - **JavaScript 키** (JavaScript Key) → For web integration
3. Generate **Client Secret**:
   - Go to "제품 설정" → "카카오 로그인" → "보안" (Security)
   - Enable "Client Secret 사용" and copy the generated secret

### 한국어

#### 1. 카카오 애플리케이션 생성

1. [카카오 개발자센터](https://developers.kakao.com/) 방문
2. 카카오 계정으로 로그인
3. "내 애플리케이션" → "애플리케이션 추가하기" 클릭
4. 애플리케이션 정보 입력:
   - **앱 이름**: Discourse 사이트 이름
   - **사업자명**: 조직/회사명

#### 2. OAuth 설정 구성

1. 애플리케이션 대시보드로 이동
2. "제품 설정" → "카카오 로그인"으로 이동
3. "카카오 로그인 활성화 설정" 체크
4. **Redirect URI** 설정: `https://yourdiscourse.com/auth/kakao/callback`
5. "동의항목"에서 스코프 설정:
   - ✅ **profile_nickname** (필수)
   - ✅ **profile_image** (권장)
   - ✅ **account_email** (선택 - 비즈니스 앱 인증 필요)

#### 3. 애플리케이션 키 확인

1. "앱 설정" → "앱 키"로 이동
2. 다음 정보 복사:
   - **REST API 키** → Client ID로 사용
   - **JavaScript 키** → 웹 연동용
3. **Client Secret** 생성:
   - "제품 설정" → "카카오 로그인" → "보안"
   - "Client Secret 사용" 활성화 후 생성된 시크릿 복사

## 🔧 Discourse Configuration / Discourse 설정

### English

1. Go to your Discourse Admin Panel → Settings
2. Search for "kakao" or navigate to Login settings
3. Configure the following settings:

| Setting | Description | Example |
|---------|-------------|---------|
| `enable login with kakao` | Enable Kakao login | ✅ Checked |
| `login with kakao client id` | REST API Key from Kakao | `a1b2c3d4e5f6g7h8...` |
| `login with kakao client secret` | Client Secret from Kakao | `x1y2z3a4b5c6d7e8...` |
| `login with kakao scope` | OAuth2 scopes | `profile_nickname,profile_image,account_email` |
| `login with kakao redirect url` | Custom redirect URL (optional) | Leave empty for default |
| `login with kakao overrides email` | Override existing user email | ⬜ Unchecked (recommended) |

### 한국어

1. Discourse 관리자 패널 → 설정으로 이동
2. "kakao" 검색 또는 로그인 설정으로 이동
3. 다음 설정들을 구성:

| 설정 | 설명 | 예시 |
|------|------|------|
| `enable login with kakao` | 카카오 로그인 활성화 | ✅ 체크 |
| `login with kakao client id` | 카카오의 REST API 키 | `a1b2c3d4e5f6g7h8...` |
| `login with kakao client secret` | 카카오의 Client Secret | `x1y2z3a4b5c6d7e8...` |
| `login with kakao scope` | OAuth2 스코프 | `profile_nickname,profile_image,account_email` |
| `login with kakao redirect url` | 커스텀 리디렉션 URL (선택사항) | 기본값 사용시 비워두기 |
| `login with kakao overrides email` | 기존 사용자 이메일 덮어쓰기 | ⬜ 해제 (권장) |

## 🧪 Development Setup / 개발 환경 설정

### English

#### 1. Local Development with Localhost

For development with `localhost:4200`:

1. **Kakao Developer Settings**:
   - Allowed Origins: `http://localhost:4200`
   - Redirect URI: `http://localhost:4200/auth/kakao/callback`

2. **Start Rails Server**:
   ```bash
   REDIRECT_URL_ORIGIN=http://localhost:4200 rails s
   ```

3. **Discourse Settings**:
   - Enable: `enable local logins: false` (optional)
   - Enable: `login required: false` (optional)

#### 2. Plugin Development

```bash
# Clone the repository
git clone https://github.com/scriptonbasestar/sb-discourse-kakao.git

# Install dependencies
bundle install

# Run tests
bundle exec rspec
```

### 한국어

#### 1. 로컬 개발 환경 (localhost)

`localhost:4200`에서 개발하는 경우:

1. **카카오 개발자센터 설정**:
   - 허용 Origins: `http://localhost:4200`
   - Redirect URI: `http://localhost:4200/auth/kakao/callback`

2. **Rails 서버 시작**:
   ```bash
   REDIRECT_URL_ORIGIN=http://localhost:4200 rails s
   ```

3. **Discourse 설정**:
   - 활성화: `enable local logins: false` (선택사항)
   - 활성화: `login required: false` (선택사항)

#### 2. 플러그인 개발

```bash
# 저장소 클론
git clone https://github.com/scriptonbasestar/sb-discourse-kakao.git

# 의존성 설치
bundle install

# 테스트 실행
bundle exec rspec
```

## 🛠️ Troubleshooting / 문제 해결

### English

#### Common Issues

**1. "Invalid redirect_uri" Error**
- **Cause**: Mismatch between Discourse callback URL and Kakao settings
- **Solution**: Ensure redirect URI in Kakao console matches exactly: `https://yourdomain.com/auth/kakao/callback`

**2. "Client authentication failed" Error**
- **Cause**: Incorrect Client ID or Client Secret
- **Solution**: Verify keys from Kakao Developer console and check for extra spaces

**3. "Insufficient scope" Error**
- **Cause**: Required permissions not granted in Kakao app
- **Solution**: Enable required scopes in Kakao console consent items

**4. Email Not Retrieved**
- **Cause**: `account_email` scope requires business app verification
- **Solution**: Either get business verification or remove email from required fields

**5. SSL/HTTPS Required**
- **Cause**: Kakao OAuth requires HTTPS in production
- **Solution**: Enable SSL certificate on your domain

#### Debug Mode

Enable detailed logging:

```ruby
# In Rails console
Rails.logger.level = Logger::DEBUG
```

### 한국어

#### 일반적인 문제들

**1. "Invalid redirect_uri" 오류**
- **원인**: Discourse 콜백 URL과 카카오 설정 불일치
- **해결**: 카카오 콘솔의 redirect URI가 정확히 일치하는지 확인: `https://yourdomain.com/auth/kakao/callback`

**2. "Client authentication failed" 오류**
- **원인**: 잘못된 Client ID 또는 Client Secret
- **해결**: 카카오 개발자 콘솔에서 키 확인 및 공백 문자 제거

**3. "Insufficient scope" 오류**
- **원인**: 카카오 앱에서 필요한 권한이 승인되지 않음
- **해결**: 카카오 콘솔 동의항목에서 필요한 스코프 활성화

**4. 이메일 정보 못 가져오는 경우**
- **원인**: `account_email` 스코프는 비즈니스 앱 인증 필요
- **해결**: 비즈니스 인증 받거나 필수 필드에서 이메일 제거

**5. SSL/HTTPS 필요**
- **원인**: 카카오 OAuth는 프로덕션에서 HTTPS 필수
- **해결**: 도메인에 SSL 인증서 활성화

#### 디버그 모드

상세 로깅 활성화:

```ruby
# Rails 콘솔에서
Rails.logger.level = Logger::DEBUG
```

## 📚 OAuth Scopes Reference / OAuth 스코프 참조

### English

| Scope | Description | Required | Business App Only |
|-------|-------------|----------|-------------------|
| `profile_nickname` | User's Kakao nickname | ✅ Yes | ❌ No |
| `profile_image` | Profile picture URL | ✅ Recommended | ❌ No |
| `account_email` | User's email address | ⬜ Optional | ✅ Yes |

### 한국어

| 스코프 | 설명 | 필수 여부 | 비즈니스 앱 전용 |
|--------|------|-----------|------------------|
| `profile_nickname` | 사용자 카카오 닉네임 | ✅ 필수 | ❌ 아니오 |
| `profile_image` | 프로필 사진 URL | ✅ 권장 | ❌ 아니오 |
| `account_email` | 사용자 이메일 주소 | ⬜ 선택 | ✅ 예 |

## 🤝 Contributing / 기여하기

### English

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### 한국어

1. 저장소 포크
2. 기능 브랜치 생성 (`git checkout -b feature/amazing-feature`)
3. 변경사항 커밋 (`git commit -m 'Add amazing feature'`)
4. 브랜치에 푸시 (`git push origin feature/amazing-feature`)
5. Pull Request 생성

## 📄 License / 라이선스

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

이 프로젝트는 MIT 라이선스 하에 배포됩니다 - 자세한 내용은 [LICENSE](LICENSE) 파일을 확인하세요.

## 🔗 Links / 관련 링크

### English
- [Discourse Meta Topic](https://meta.discourse.org/t/login-with-kakao-plugin/117564)
- [Kakao Developers](https://developers.kakao.com/)
- [Kakao Login API Documentation](https://developers.kakao.com/docs/latest/ko/kakaologin/common)

### 한국어
- [Discourse 메타 토픽](https://meta.discourse.org/t/login-with-kakao-plugin/117564)
- [카카오 개발자센터](https://developers.kakao.com/)
- [카카오 로그인 API 문서](https://developers.kakao.com/docs/latest/ko/kakaologin/common)

## 📊 Support / 지원

### English
- **Discourse Versions**: 3.1.999 - 3.5.0+
- **Ruby Versions**: 3.0+
- **Kakao API**: OAuth 2.0

### 한국어
- **Discourse 버전**: 3.1.999 - 3.5.0+
- **Ruby 버전**: 3.0+
- **카카오 API**: OAuth 2.0

---

**Made with ❤️ for the Korean Discourse community**  
**한국 Discourse 커뮤니티를 위해 ❤️ 으로 제작**



