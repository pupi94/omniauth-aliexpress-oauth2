# frozen_string_literal: true

require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class Aliexpress < OmniAuth::Strategies::OAuth2
      class NoAuthorizationCodeError < StandardError; end

      option :client_options,
             authorize_url: '/authorize',
             token_url: '/token',
             site: 'https://oauth.aliexpress.com'
      option :authorize_params, sp: 'ae', view: 'web'
      # option :provider_ignores_state, true

      info do
        {
          user_nick: access_token.params['user_nick'],
          user_id: access_token.params['user_id'],
          locale: access_token.params['locale'],
          sp: access_token.params['sp']
        }
      end

      credentials do
        {
          token: access_token.token,
          refresh_token: access_token.refresh_token,
          expires_at: access_token.params['expire_time'].to_i / 1000,
          refresh_token_expires_at: access_token.params['refresh_token_valid_time'].to_i / 1000
        }
      end

      extra do
        {
          w1_expires_at: access_token.params['w1_valid'].to_i / 1000,
          w2_expires_at: access_token.params['w2_valid'].to_i / 1000,
          r1_expires_at: access_token.params['r1_valid'].to_i / 1000,
          r2_expires_at: access_token.params['r2_valid'].to_i / 1000
        }
      end

      def callback_url
        options[:callback_url] || super
      end
    end
  end
end
