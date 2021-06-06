Rails.application.config.middleware.use OmniAuth::Builder do
  # if Rails.env.development? || Rails.env.test?
  #   provider :github, "b9a73409e7674eed8964", "501f9e95358ad4c7ea0d00de50046dea02aa04ee"
  # else
    # provider :github,
    # Rails.application.credentials.github[:client_id],
    # Rails.application.credentials.github[:client_secret]
  # end

  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end
## 5/29 19時22~