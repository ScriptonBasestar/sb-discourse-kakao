# frozen_string_literal: true

# name: sb-discourse-kakao
# about: discourse plugin for Kakao login and other features
# meta_topic_id:
# version: 0.2.0
# authors: archmagece
# url: https://github.com/scriptonbasestar/sb-discourse-kakao

require_relative "lib/validators/enable_login_with_kakao_validator"

enabled_site_setting :enable_login_with_kakao

register_svg_icon "kakao"

require_relative "lib/omniauth/strategies/kakao"
require_relative "lib/auth/login_with_kakao_authenticator"

auth_provider authenticator: Auth::LoginWithKakaoAuthenticator.new, icon: "kakao"
