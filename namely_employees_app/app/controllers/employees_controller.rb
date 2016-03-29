class EmployeesController < ApplicationController
  def index
    response = auth_data.get('https://verner-eng-homework.namely.com/api/v1/profiles.json?limit=all')
    @data = JSON.parse(response.body)
  end

  def sort_employees
    response = auth_data.get('https://verner-eng-homework.namely.com/api/v1/profiles.json?sort=first_name')
    @data = JSON.parse(response.body)
  end

  private

  def auth_data
    auth_code = session['oauth_access_code']
    token = NamelyOauth.oauth_client.auth_code.get_token(auth_code,
      :redirect_uri => NamelyOauth.redirect_url)
  end

end

