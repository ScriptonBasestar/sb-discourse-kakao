# frozen_string_literal: true

require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class Kakao < OmniAuth::Strategies::OAuth2
      DEFAULT_SCOPE = "profile_nickname,profile_image".freeze

      BASE_URL = "https://kauth.kakao.com".freeze
      AUTHORIZE_URL = "/oauth/authorize".freeze
      AUTHORIZE_TOKEN_URL = "/oauth/token".freeze
      USER_INFO_URL = "https://kapi.kakao.com/v2/user/me".freeze

      option :name, :kakao

      option :client_options,
             site: BASE_URL,
             authorize_url: AUTHORIZE_URL,
             token_url: AUTHORIZE_TOKEN_URL

      uid { raw_info["id"].to_s }

      info do
        props = raw_info["properties"] || {}
        account = raw_info["kakao_account"] || {}
        hash = {
          name: props["nickname"],
          username: account["email"],
          image: props["thumbnail_image"],
        }
        if account["has_email"] && account["is_email_verified"] && account["is_email_valid"]
          hash[:email] = account["email"]
        end
        hash
      end

      extra { { raw_info: raw_info } }

      def callback_url
        # Support both redirect_url (legacy in our plugins) and default callback
        options.redirect_url || (full_host + callback_path)
      end

      private

      def raw_info
        @raw_info ||= access_token.get(USER_INFO_URL).parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "kakao", "Kakao"

