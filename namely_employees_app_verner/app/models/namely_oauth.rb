class NamelyOauth

  def self.oauth_client
    OAuth2::Client.new(Rails.application.secrets.namely_oauth_client_id,
      Rails.application.secrets.namely_oauth_secret,
      :authorize_url => '/api/v1/oauth2/authorize',
      :token_url => '/api/v1/oauth2/token',
      :site => 'https://verner-eng-homework.namely.com')
  end

  def self.redirect_url
    'http://localhost:3000/namely/auth_callback'
  end

end
