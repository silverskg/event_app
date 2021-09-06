AUTH_URI = 'https://access.line.me/oauth2/v2.1/authorize'

def auth_uri(state)
  params = {
    response_type: 'code',
    client_id: @admin.line_login_id,
    redirect_uri: callback_uri,
    state: state,
    scope: 'openid',
    prompt: 'consent', # 必ずLINE認証を許可するようにするオプション
    bot_prompt: 'aggressive' # ログイン後に連携した公式アカウントと友だちになるか聞く画面を出してくれる
  }

  # NOTE: https://developers.line.biz/ja/docs/line-login/integrate-line-login/#making-an-authorization-request
  "#{AUTH_URI}?#{params.to_query}"
end