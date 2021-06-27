class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def line
    callback_for(:line)
  end

  def github
    callback_for(:github)
  end

  private
  def callback_for(provider)
    @user = User.find_for_sns_oauth(request.env["omniauth.auth"])
    session[:user_id] = @user.id
    if @user.persisted? # データベースに保存されていればログイン成功
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: provider.upcase) if is_navigational_format?
    else # ログイン失敗
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
