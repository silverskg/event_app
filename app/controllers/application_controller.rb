class ApplicationController < ActionController::Base
  # before_action :authenticate
  # helper_method :logged_in?, :current_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

  # def logged_in?
  #   !!current_user
  # end

  # def current_user
  #   return unless session[:user_id]
  #   @current_user ||= User.find(session[:user_id])
  # end

  # def authenticate
  #   return if logged_in?
  #   redirect_to root_path, alert: "ログインしてください"
  # end
end
