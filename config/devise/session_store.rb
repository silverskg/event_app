binding.pry
if Rails.env.production?
  Rails.application.config.session_store :cookie_store, key: '_events_app_session', expire_after: 1.weeks, domain: :all
else
  Rails.application.config.session_store :cookie_store, key: '_events_app_session', domain: :all
end

# Rails.application.config.session_store :cookie_store, key: '_events_app_session'
