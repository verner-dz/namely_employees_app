class NamelyController < ApplicationController

  def auth
    url = NamelyOauth.oauth_client.auth_code.authorize_url(:redirect_uri => NamelyOauth.redirect_url)
    redirect_to url
  end

  def auth_callback
    auth_code = params[:code]
    token = NamelyOauth.oauth_client.auth_code.get_token(auth_code,
      :redirect_uri => NamelyOauth.redirect_url)
    session['oauth_access_code'] = auth_code
    redirect_to employees_path
  end


end



