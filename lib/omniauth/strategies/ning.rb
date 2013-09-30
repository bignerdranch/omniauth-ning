require 'omniauth/strategies/oauth'

module OmniAuth
  module Strategies
    class Ning < OmniAuth::Strategies::OAuth
      include OmniAuth::Strategy

        DEFAULT_ENDPOINT = 'https://external.ningapis.com/xn/rest/YRGUniverse/1.0'
        option :name, "ning"
        option :oauth_token

        # This is where you pass the options you would pass when
        # initializing your consumer from the OAuth gem.
        option :client_options, {
          site:           DEFAULT_ENDPOINT,
          token_url:      "/Token"
        }

      def request_phase
        if options.oauth_token.present?
          super
        else
          redirect '/ning_sessions/new'
        end
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