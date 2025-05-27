# frozen_string_literal: true

# name: sb-discourse-kakao
# about: discourse plugin for Kakao login and other features
# meta_topic_id:
# version: 0.0.1
# authors: archmagece
# url: https://github.com/scriptonbasestar/sb-discourse-kakao

enabled_site_setting :enable_login_with_kakao

gem "sb-omniauth-kakao", "0.3.4"
# gem 'sb-omniauth-kakao', git: 'git@github.com:ScriptonBasestar/sb-omniauth-kakao.git'

# register_asset "stylesheets/discourse-custom-oauth-icons.scss"
register_svg_icon "kakao"

require "sb-omniauth-kakao"
# require_relative "lib/omniauth/strategies/kakao"

require_relative "lib/auth/login_with_kakao_authenticator"
require_relative "lib/validators/enable_login_with_kakao_validator"

auth_provider authenticator: Auth::LoginWithKakaoAuthenticator.new, icon: "kakao"
