class ApplicationController < ActionController::Base
  # before_action :authenticate, except: :logged_in?
  # before_action :authenticate_user!
  # helper_method :logged_in?, :current_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :send_message
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

  # linemessage_api
  # def client
  #   @client ||= Line::Bot::Client.new { |config|
  #     config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
  #     config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
  #   }
  # end

  private


  # def logged_in?
  #   !!current_user
  # end

# binding.pry

#   def current_user
#     return unless session[:user_id]
#     @current_user ||= User.find(session[:user_id])
#   end

  # def authenticate_user!
  #   return if logged_in?
  #   redirect_to new_user_session_path, alert: "ログインしてください"
  # end

end
