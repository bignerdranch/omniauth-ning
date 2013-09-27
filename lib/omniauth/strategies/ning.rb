require 'omniauth/strategies/oauth'

module OmniAuth
  module Strategies
    class Ning < OmniAuth::Strategies::OAuth
      include OmniAuth::Strategy

        DEFAULT_ENDPOINT = 'https://external.ningapis.com/xn/rest/YRGUniverse/1.0'
        option :name, "ning"
        option :fields, [:email]

        # This is where you pass the options you would pass when
        # initializing your consumer from the OAuth gem.
        option :client_options, {
          site:           DEFAULT_ENDPOINT,
          authorize_url:  "/Token",
          token_url:      "/Token"
        }

      # These are called after authentication has succeeded. If
      # possible, you should try to set the UID without making
      # additional calls (if the user id is returned with the token
      # or as a URI parameter). This may not be possible with all
      # providers.
      uid{ request.params['entry']['author'] }

      info do
        {
          author: raw_info['entry']['author'],
          oauth_token: raw_info['entry']['oauthToken'],
          oauth_token_secret: raw_info['entry']['oauthTokenSecret']
        }
      end

      def call env
        env['ning.strategy'] = self
        super
      end

      def raw_info
        @raw_info ||= access_token.get("/User?author=#{uid}").parsed
      end
    end
  end
end