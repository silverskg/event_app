class ApplicationController < ActionController::Base
  # before_action :authenticate, except: :logged_in?
  helper_method :logged_in?, :current_user

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

  def authenticate
    return if logged_in?
    redirect_to new_user_session_path, alert: "ログインしてください"
  end

  private

  def logged_in?
    !!current_user
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  
end
