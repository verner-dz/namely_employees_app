class EmployeesController < ApplicationController
  def index
    auth_code = session['oauth_access_code']
    token = NamelyOauth.oauth_client.auth_code.get_token(auth_code,
      :redirect_uri => NamelyOauth.redirect_url)
    response = token.get('https://verner-eng-homework.namely.com/api/v1/profiles.json?limit=all')
    @data = JSON.parse(response.body)
  end



end
