# Contributing to Login with Kakao Plugin

Thank you for your interest in contributing! 기여해 주셔서 감사합니다!

## Development Setup

### Prerequisites
- Discourse development environment
- Ruby 3.0+
- Kakao Developer account
- Git

### Local Setup

1. **Clone Discourse:**
   ```bash
   git clone https://github.com/discourse/discourse.git
   cd discourse
   ```

2. **Clone this plugin:**
   ```bash
   cd plugins
   git clone https://github.com/scriptonbasestar/sb-discourse-kakao.git
   ```

3. **Install dependencies:**
   ```bash
   bundle install
   pnpm install
   ```

4. **Configure Kakao credentials:**
   - Create a Kakao Developer application at https://developers.kakao.com
   - Set environment variables or configure in Admin panel

5. **Start Discourse:**
   ```bash
   bin/rails server
   ```

6. **Access the site:**
   - Visit http://localhost:4200
   - Login as admin (username: admin, password: admin)
   - Navigate to Admin > Settings > Plugins to configure

## Testing

### Run Tests
```bash
# Run all plugin tests (requires Discourse environment)
bundle exec rspec plugins/sb-discourse-kakao/spec

# Run specific test file
bundle exec rspec plugins/sb-discourse-kakao/spec/lib/validators/enable_login_with_kakao_validator_spec.rb
```

### Linting

**Ruby:**
```bash
cd plugins/sb-discourse-kakao
bundle exec rubocop

# Auto-fix violations
bundle exec rubocop --autocorrect-all
```

**JavaScript/YAML/Markdown:**
```bash
pnpm exec prettier --check "**/*.{yml,md,js,json}"

# Auto-fix formatting
pnpm exec prettier --write "**/*.{yml,md,js,json}"

# ESLint for JavaScript
pnpm exec eslint .
```

## Code Style

### Ruby
- Follow `rubocop-discourse` guidelines (extends standard Rubocop)
- Use `syntax_tree` for formatting: `bundle exec stree write lib/**/*.rb`
- Prefer explicit returns only when necessary
- Use safe navigation operator (`&.`) for potentially nil objects

### JavaScript/TypeScript
- Follow Discourse's ESLint configuration
- Use Prettier for consistent formatting
- Prefer modern ES6+ syntax

### YAML
- 2-space indentation
- Quote strings containing special characters
- Follow Discourse locale file structure

## Commit Message Convention

We follow conventional commits with mandatory scope:

```
type(scope): imperative verb description

Optional body with more details

Model: claude-sonnet-4-5
Co-Authored-By: Claude <noreply@anthropic.com>
```

### Types
- `fix`: Bug fix
- `feat`: New feature
- `docs`: Documentation only
- `chore`: Maintenance tasks
- `refactor`: Code restructuring
- `test`: Adding or updating tests
- `style`: Code style changes (formatting, etc.)

### Scopes
- `kakao`: Core Kakao authentication functionality
- `auth`: Authentication logic
- `settings`: Configuration and settings
- `locale`: Translations and localization
- `deps`: Dependencies
- `docs`: Documentation files

### Examples
```bash
# Bug fix
git commit -m "fix(auth): resolve callback URL handling in localhost environment"

# New feature
git commit -m "feat(settings): add custom scope configuration option"

# Documentation
git commit -m "docs(readme): update troubleshooting section with common errors"

# Maintenance
git commit -m "chore(deps): update rubocop-discourse to 3.12.1"
```

## Pull Request Process

1. **Create a feature branch:**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make your changes:**
   - Follow code style guidelines
   - Add tests for new functionality
   - Update documentation if needed

3. **Test your changes:**
   ```bash
   bundle exec rspec spec/
   bundle exec rubocop
   ```

4. **Commit with conventional commit format:**
   ```bash
   git commit -m "feat(scope): description"
   ```

5. **Push and create PR:**
   ```bash
   git push origin feature/your-feature-name
   ```
   - Go to GitHub and create a Pull Request
   - Fill in the PR template
   - Link any related issues

6. **Wait for review:**
   - Address review comments
   - Update PR with requested changes
   - Ensure CI checks pass

## What to Contribute

### Good First Issues
- Fixing typos in documentation
- Adding missing translations
- Improving error messages
- Adding test coverage

### Feature Contributions
- New OAuth scopes support
- Enhanced user profile mapping
- Additional configuration options
- Performance improvements

### Bug Reports
- Search existing issues first
- Provide clear reproduction steps
- Include environment details (Discourse version, Ruby version, etc.)
- Share relevant logs

## Code Review Guidelines

### For Contributors
- Keep PRs focused on single feature/fix
- Write clear PR descriptions
- Respond to feedback promptly
- Be open to suggestions

### For Reviewers
- Be constructive and respectful
- Test changes locally when possible
- Check for security implications
- Verify tests and documentation

## Development Tips

### Testing OAuth Flow Locally

1. **Setup Kakao Developer Console:**
   - Add `http://localhost:4200` as redirect URI
   - Add `http://localhost:4200/auth/kakao/callback` as callback URL

2. **Configure Discourse:**
   - Set `REDIRECT_URL_ORIGIN=http://localhost:4200` environment variable
   - Or use custom redirect URL in admin settings

3. **Test authentication:**
   - Click "Login with Kakao" button
   - Verify user creation and profile sync

### Debugging

**Enable OmniAuth debug logging:**
```ruby
# In config/environments/development.rb
OmniAuth.config.logger = Rails.logger
```

**Check Rails logs:**
```bash
tail -f log/development.log | grep -i kakao
```

**Inspect OAuth callback data:**
```ruby
# Add to authenticator temporarily
def after_authenticate(auth)
  Rails.logger.debug "Kakao auth data: #{auth.inspect}"
  super
end
```

## Questions or Problems?

- Open an issue for bugs or feature requests
- Check existing issues before creating new ones
- For security issues, email maintainers directly (don't create public issue)
- Join Discourse Meta for general Discourse plugin development questions

## License

By contributing, you agree that your contributions will be licensed under the MIT License.

## Thank You!

Your contributions make this project better for everyone. We appreciate your time and effort! 🙏
