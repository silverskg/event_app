# def line_user_id(code)
#   verify_id_token(access_token_data(code))['sub']
# end

# def access_token_data(code)
#   req_body = {
#     grant_type: 'authorization_code',
#     code: code,
#     redirect_uri: callback_uri, # NOTE: LINEログインのチャネルのコンソールで設定した「コールバックURL」と比較している。
#     client_id: @admin.line_login_id,
#     client_secret: @admin.line_login_secret
#   }

#   # NOTE: https://developers.line.biz/ja/docs/line-login/integrate-line-login/#get-access-token
#   res = conn.post do |req|
#     req.url '/oauth2/v2.1/token'
#     req.headers['Content-Type'] = 'application/x-www-form-urlencoded'
#     req.body = req_body
#   end
#   JSON.parse(handle_error(res).body)
# end

# def verify_id_token(access_token_data)
#   req_body = {
#     id_token: access_token_data['id_token'],
#     client_id: @admin.line_login_id
#   }
#   # NOTE: https://developers.line.biz/ja/reference/social-api/#verify-id-token
#   res = conn.post do |req|
#     req.url '/oauth2/v2.1/verify'
#     req.body = req_body
#   end
#   JSON.parse(handle_error(res).body)
# end
