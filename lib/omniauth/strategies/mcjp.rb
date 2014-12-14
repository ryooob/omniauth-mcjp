require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Mcjp < OmniAuth::Strategies::OAuth2
      # Give your strategy a name.
      option :name, "mcjp"

      # This is where you pass the options you would pass when
      # initializing your consumer from the OAuth gem.
      option :client_options, {
        :site          => 'https://minecraft.jp',
        :authorize_url => 'https://minecraft.jp/oauth/authorize',
        :token_url     => 'https://minecraft.jp/oauth/token'
      }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ raw_info['id'] }

      info do
        {
          :preferred_username => raw_info['preferred_username'],
          :profile            => raw_info['profile'],
          :uuid               => raw_info['uuid'],
          :email              => raw_info['email'],
          :email_verified     => raw_info['email_verified'],
          :sub                => raw_info['sub'],
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/oauth/userinfo').parsed
      end
    end
  end
end