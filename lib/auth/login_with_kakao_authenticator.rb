# frozen_string_literal: true


class Auth::LoginWithKakaoAuthenticator < ::Auth::ManagedAuthenticator
  def name
    "kakao"
  end

  def enabled?
    SiteSetting.enable_login_with_kakao
  end

  def register_middleware(omniauth)
    omniauth.provider :kakao,
                      setup:
                        lambda { |env|
                          strategy = env["omniauth.strategy"]
                          strategy.options[:client_id] = SiteSetting.login_with_kakao_client_id
                          strategy.options[:client_secret] = SiteSetting.login_with_kakao_client_secret
                          
                          # 카카오 OAuth2 스코프 설정
                          scope = SiteSetting.login_with_kakao_scope.presence || "profile_nickname,profile_image"
                          strategy.options[:scope] = scope
                          
                          # 리디렉션 URL 설정 - 카카오 개발자센터에서 설정한 URL과 일치해야 함
                          if SiteSetting.login_with_kakao_redirect_url.present?
                            strategy.options[:redirect_uri] = SiteSetting.login_with_kakao_redirect_url
                          else
                            strategy.options[:callback_path] = SiteSetting.login_with_kakao_redirect_path
                          end
                        }
  end

  def always_update_user_email?
    SiteSetting.login_with_kakao_overrides_email
  end

  def primary_email_verified?(auth)
    SiteSetting.login_with_kakao_email_verified
  end

  # 카카오 사용자 정보를 Discourse 사용자 정보로 매핑
  def after_authenticate(auth)
    result = super

    # 카카오에서 제공하는 닉네임을 username으로 사용
    if auth.info&.nickname.present?
      result.username = auth.info.nickname
    end

    # 카카오 프로필 이미지 URL 설정
    if auth.info&.image.present?
      result.avatar_url = auth.info.image
    end

    result
  rescue => e
    Rails.logger.error "Kakao authentication error: #{e.message}"
    result
  end
end
