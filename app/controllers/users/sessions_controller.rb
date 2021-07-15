class Users::SessionsController < Devise::SessionsController
  # skip_before_action :authenticate, only: :create

  def create
    binding.pry
    user = User.find_by(id: session[:user_id])
    session[:user_id] = user.id
    redirect_to root_path, notice: "ログインしました"
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end
end
