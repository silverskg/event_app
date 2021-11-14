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
    # user_id = provider[0][:uid]
    # response = client.push_message(user_id, message)
  end


#   def callback
#     # binding.pry
#     # Postモデルの中身をランダムで@postに格納する
#     @post=Post.offset( rand(Post.count) ).first
#     body = request.body.read

#     signature = request.env['HTTP_X_LINE_SIGNATURE']
#     unless client.validate_signature(body, signature)
#       head :bad_request
#     end

#     events = client.parse_events_from(body)

#     events.each { |event|

#       # event.message['text']でLINEで送られてきた文書を取得
#       if event.message['text'].include?("デュエル")
#         response = "決闘"
#       elsif event.message["text"].include?("プロテイン")
#         response = "マイプロテイン"
#       elsif event.message['text'].include?("おはよう")
#         response = "ございます"
#       elsif event.message['text'].include?("うんち")
#         response = "WC" * 50
#       else
#         response = @post.name
#       end
#       #if文でresponseに送るメッセージを格納

#       case event
#       when Line::Bot::Event::Message
#         case event.type
#         when Line::Bot::Event::MessageType::Text
#           message = {
#             type: 'text',
#             text: response
#           }
#           client.reply_message(event['replyToken'], message)
#         when Line::Bot::Event::MessageType::Follow #友達登録イベント
#           userId = event['source']['userId'] 
#           User.find_or_create_by(uid: userId)
#         when Line::Bot::Event::MessageType::Unfollow #友達削除イベント
#           userId = event['source']['userId']  
#           user = User.find_by(uid: userId)
#           user.destroy if user.present?
#         end
#       end

# # binding.pry
# #        # LINEお友達追された場合
# #       when Line::Bot::Event::Follow
# #         # 登録したユーザーのidをユーザーテーブルに格納
# #         line_id = event['source']['userId']
# #         User.create(line_id: line_id)
# #         # LINEお友達解除された場合
# #       when Line::Bot::Event::Unfollow
# #         # お友達解除したユーザーのデータをユーザーテーブルから削除
# #         line_id = event['source']['userId']
# #         User.find_by(line_id: line_id).destroy
# #       end
# #     end
#     }

#     head :ok
#   end
end
