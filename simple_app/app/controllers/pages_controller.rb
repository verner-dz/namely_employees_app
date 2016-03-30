class PagesController < ApplicationController
  def index
  end

  def auth
    client = OAuth2::Client.new(Rails.application.secrets.namely_oauth_client_id,
      Rails.application.secrets.namely_oauth_secret,
      :site => 'https://verner-eng-homework.namely.com',
      :authorize_url => '/api/v1/oauth2/authorize')
    url = client.auth_code.authorize_url(:redirect_uri => 'http://localhost:3000/namely/auth_callback')
    redirect_to url
  end

  def auth_callback
    auth_code = params[:code]
    client = OAuth2::Client.new(Rails.application.secrets.namely_oauth_client_id,
      Rails.application.secrets.namely_oauth_secret,
      :site => 'https://verner-eng-homework.namely.com',
      :token_url => '/api/v1/oauth2/token')
    raise
    token = client.auth_code.get_token(auth_code, :redirect_uri => 'http://localhost:3000/namely/auth_callback')
    redirect_to namely_employees_path(:code => auth_code)
  end

  def employees
    auth_code = params[:code]
    client = OAuth2::Client.new(Rails.application.secrets.namely_oauth_client_id,
      Rails.application.secrets.namely_oauth_secret,
      :site => 'https://verner-eng-homework.namely.com',
      :token_url => '/api/v1/oauth2/token')
    token = client.auth_code.get_token(auth_code, :redirect_uri => 'http://localhost:3000/namely/auth_callback')
    response = token.get('https://verner-eng-homework.namely.com/api/v1/profiles.json?limit=all')
    @data = JSON.parse(response.body)
  end
end


