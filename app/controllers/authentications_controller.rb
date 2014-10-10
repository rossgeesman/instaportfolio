class AuthenticationsController < ApplicationController
  def new
    redirect_to Instagram.authorize_url(:redirect_uri => CALLBACK_URL)
  end

  def create
  	response = Instagram.get_access_token(params[:code], :redirect_uri => CALLBACK_URL)
  	session[:access_token] = response.access_token
  	redirect_to root_url
  end

  def destroy
   reset_session
   redirect_to root_url
  end
end
