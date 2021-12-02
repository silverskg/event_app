class Event < ApplicationRecord
  require 'line/bot'  # gem 'line-bot-api'

  mount_uploader :image, ImageUploader #ImageUploaderと連結

  belongs_to :owner, class_name: "User"
  has_many :tickets, dependent: :destroy
  has_many :ticketing_users, through: :tickets, source: :user

  validates :name, length: { maximum: 50}, presence: true
  validates :place, length: { maximum: 100}, presence: true
  validates :content, length: { maximum: 2000}, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :period, presence: true
  validate :start_time_should_be_before_end_time

  def created_by?(user)
    return false unless user
    owner_id == user.id
  end

  def image_owner
    if owner.image_url == ""
      owner.image_url = "roof_log.png"
    else
      owner.image_url
    end
  end



  def send_message
    # binding.pry
    message = {
      type: 'text',
      text: 'アルバイトの更新がありました!以下サイトからご確認に方よろしくお願いします。
      https://work-event.herokuapp.com/event'
    }
    user_id = "U2f1f080dcff189b5db34fc229d1d5a0e"
    response = client.push_message(user_id, message)
  end

  private

  def start_time_should_be_before_end_time
    return unless start_time && end_time

    if start_time >= end_time
      errors.add(:start_time, "は終了時間よりも前に設定してください")
    end
  end

  # line message_api
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

end
