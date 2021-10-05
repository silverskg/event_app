class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # 以下を追加
  protect_from_forgery except: [:callback]
  def line
    
    # stateが異なっていたら例外を出す
    # raise Line::InvalidState unless params[:state] == session[:state]

    # line_user_id = Line::Api::Oauth.new(admin).line_user_id(params[:code])
    # User.create!(line_user_id: line_user_id)

    callback(:line)
  end

  def github
    callback(:github)
  end


  private

  def callback(provider)
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
