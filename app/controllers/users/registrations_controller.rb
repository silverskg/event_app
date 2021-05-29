class Users::RegistrationsController < Devise::RegistrationsController
  
  def build_resource(hash = {})
    # 自作したメソッドを使いuidを必ず埋める
    hash[:provider] = User.create_unique_string
    hash[:uid] = User.create_unique_string
    hash[:name] = User.create_unique_string
    hash[:image_url] = User.create_unique_string
    super
  end

  protected
    def update_resource(resource, params)
      
      return super if params["password"]&.present?
      # 現在のパスワードなしでアカウントの更新をする
      resource.update_without_password(params.except("current_password"))
    end
end