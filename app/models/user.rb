class User < ApplicationRecord 
  validates :email, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: { scope: :provider }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:github]
  before_destroy :check_all_events_finished

  has_many :created_events, class_name: "Event", foreign_key: "owner_id", dependent: :nullify
  has_many :tickets, dependent: :nullify
  has_many :participathing_events, through: :tickets, source: :event
  
  def self.find_for_github_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      # 名前を取得するときはこのように書く（今回はUserモデルにname属性がないのでエラーなる） 
      user.name = auth.info.name
      user.email = auth.info.email
      # 任意の20文字の文字列を作成する
      user.password = Devise.friendly_token[0, 20]
    end
  end
  # 最後に使います。
  def self.create_unique_string
    SecureRandom.uuid
  end

  # def self.find_or_create_from_auth_hash!(auth_hash)
  #   provider = auth_hash[:provider]
  #   uid = auth_hash[:uid]
  #   nickname = auth_hash[:info][:nickname]
  #   image_url = auth_hash[:info][:image]

  #   User.find_or_create_by!(provider: provider, uid: uid) do |user|
  #     user.name = nickname
  #     user.image_url = image_url
  #   end
  # end

  

  private

  def check_all_events_finished
    now = Time.zone.now
    if created_events.where(":now < end_at", now: now).exists?
      errors[:base] << "公開中の未開催のイベントが存在します。"
    end

    if participathing_events.where(":now < end_at", now: now).exists?
      errors[:bose] << "未開催の参加イベントが存在します。"
    end

    throw(:abort) unless errors.empty?
  end
end
