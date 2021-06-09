Rails.application.config.middleware.use OmniAuth::Builder do
 
  # provider :github, ENV['GITHUB_ID'], ENV['GITHUB_SECRET'],
  # {:provider_ignores_state => true}
end
## 5/29 19時22~