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
                          strategy.options[
                            :client_secret
                          ] = SiteSetting.login_with_kakao_client_secret
                          strategy.options[:scope] = SiteSetting.login_with_kakao_scope
                          if SiteSetting.login_with_kakao_redirect_url.present?
                            strategy.options[:redirect_url] = SiteSetting.login_with_kakao_redirect_url
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
end
