class Users::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_normal_user, only: %i[update destroy]

  protect_from_forgery
  def build_resource(hash = {})
    # 自作したメソッドを使いuidを必ず埋める
    # hash[:provider] = User.create_unique_string
    hash[:uid] = User.create_unique_string
    # hash[:name] = User.name
    # hash[:image_url] = User.create_unique_string
    super
    
  end

  #//ゲスト
  def ensure_normal_user
    if resource.email == "guest@example.com"
      redirect_to root_path, alert: "ゲストユーザーの更新・削除はできません。"
    end
  end

  
  protected
    def update_resource(resource, params)
      return super if params["password"]&.present?
      # 現在のパスワードなしでアカウントの更新をする
      resource.update_without_password(params.except("current_password"))
    end
end
