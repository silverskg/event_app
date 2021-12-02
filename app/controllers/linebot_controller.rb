class LinebotController < ApplicationController
  # skip_before_action :authenticate_user! #deviseでの認の許可
  require 'line/bot'  # gem 'line-bot-api'

  # callbackアクションのCSRFトークン認証を無効
  protect_from_forgery :except => [:callback]

  
  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    message = {
      type: 'text',
      text: 'アルバイトの更新がありました!以下サイトからご確認に方よろしくお願いします。
      https://work-event.herokuapp.com/events'
    }
    provider = User.where(provider: "line")
    provider.each do|values|
      user_id = values[:uid]
      response = client.push_message(user_id, message)
    end
    redirect_to welcome_home_path, notice: "送信しました"
  end

end
