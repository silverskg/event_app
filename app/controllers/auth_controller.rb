class AuthController < ApplicationController
  def index
    admin = Admin.find(params[:admin_id])

    state = SecureRandom.hex(32)
    session[:state] = state
    redirect_to Line::Api::Oauth.new(admin).auth_uri(state)
  end
end