class User < ApplicationRecord 
  before_destory :check_all_events_finished

  has_many :created_events, class_name: "Event", foreign_key: "owner_id", dependent: :nullify
  has_many :tickets, dependent: :nullify
  has_many :participathing_events, through: :tickets, source: :event
  
  def self.find_or_create_from_auth_hash!(auth_hash)
    provider = auth_hash[:provider]
    uid = auth_hash[:uid]
    nickname = auth_hash[:info][:nickname]
    image_url = auth_hash[:info][:image]

    User.find_or_create_by!(provider: provider, uid: uid) do |user|
      user.name = nickname
      user.image_url = image_url
    end
  end

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
