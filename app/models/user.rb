class User < ApplicationRecord 

  validates :email, presence: true, uniqueness: true
  validates :uid, presence: true, uniqueness: { scope: :provider }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github line]
  before_destroy :check_all_events_finished

  has_many :user
  has_many :created_events, class_name: "Event", foreign_key: "owner_id", dependent: :nullify
  has_many :tickets, dependent: :nullify
  # :ticket_events はuserがどのeventに参加しているのか取得
  # source:オプションは関連付け元の名前を指定するため記述
  has_many :ticket_events, through: :tickets, source: :event

  has_many :participathing_events, through: :tickets, source: :event
  has_many :messages


  def image_owner
    if user.image_url == ""
      user.image_url = "default.png"
    else
      user.image_url
    end
  end

  def self.find_for_sns_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
      # 名前を取得するときはこのように書く（今回はUserモデルにname属性がないのでエラーなる） 
      user.name = auth.info.name
      user.email = auth.info.email
      user.image_url = auth.info.image
      # 任意の20文字の文字列を作成する
      user.password = Devise.friendly_token[0, 20]
    end
  end
  # 最後に使います。
  def self.create_unique_string
    SecureRandom.uuid
  end


  def self.auth_uri
    params = {
      response_type: 'code',
      client_id: @user.line_login_id,
      redirect_uri: callback_uri,
      state: state,
      scope: 'openid',
      prompt: 'consent', # 必ずLINE認証を許可するようにするオプション
      bot_prompt: 'aggressive' # ログイン後に連携した公式アカウントと友だちになるか聞く画面を出してくれる
    }
  
    "#{AUTH_URI}?#{params.to_query}"
  end
  
#///ゲストログイン メソッド
  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.uid = User.create_unique_string
      user.name = "ゲスト"
    end
  end

#////ここまで

  #///追加 lineログイン
  def social_profile(provider)
    social_profiles.select { |sp| sp.provider == provider.to_s }.first
  end

  def set_values(omniauth)
    return if provider.to_s != omniauth["provider"].to_s || uid != omniauth["uid"]
    credentials = omniauth["credentials"]
    info = omniauth["info"]

    access_token = credentials["refresh_token"]
    access_secret = credentials["secret"]
    credentials = credentials.to_json
    name = info["name"]
    # self.set_values_by_raw_info(omniauth['extra']['raw_info'])
  end

  def set_values_by_raw_info(raw_info)
    self.raw_info = raw_info.to_json
    self.save!
  end

  def image_owner
    if self.image_url == ""
      self.image_url = "roof_log.png"
    else
      self.image_url
    end
  end

  #///ここまで


  private

  def check_all_events_finished
    now = Time.zone.now
    if created_events.where(":now < end_time", now: now).exists?
      errors[:base] << "公開中の未開催のイベントが存在します。"
    end

    if participathing_events.where(":now < end_time", now: now).exists?
      errors[:bose] << "未開催の参加イベントが存在します。"
    end

    throw(:abort) unless errors.empty?
  end
end
