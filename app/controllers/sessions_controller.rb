class SessionsController < ApplicationController
  def create
    binding.pry
    user = User.find_or_create_form_auth_hash!(rquest.env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました"
  end
end
