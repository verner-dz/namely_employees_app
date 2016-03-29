require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Namely < OmniAuth::Strategies::OAuath2
      option :name, 'namely'
      option :client_options, {
        site: 'https://verner-eng-homework.namely.com',
        authorize_url: 'https://verner-eng-homework.namely.com/api/v1/oauth2/authorize?
      response_type=code&client_id=7524a873efc4e72615506f27a3e15b50&redirect_uri=http%3A%2F%localhost:3000%2Fauth%2Fnamely%3Fcallback'
      }

      uid {
        raw_info['id']
      }

      info do
        {
          email: raw_info['email'],
        }
      end

      extra do
        { raw_info: raw_info }
      end

      def raw_info
        @raw_info ||= access_token.get('/me').parsed
      end
    end
  end
end




