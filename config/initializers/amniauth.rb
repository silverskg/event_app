Rails.application.config.middleware.use OmniAuth::Builder do
  
  if Rails.env.development? || Rails.env.test?
    provider :github, "ebcff22c215d8b8f4775", "1b4b026175ca77339de3e1ae6dfead3b0e51746e"
  else
    provider :github,
    Rails.application.credentials.github[:client_id],
    Rails.application.credentials.github[:client_secret]
  end
end
## 5/29 19時22~