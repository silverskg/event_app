source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

gem 'rails', '~> 6.0.3', '>= 6.0.3.6'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bootsnap', '>= 1.4.2', require: false
# ログイン関連ページにBootstrapを適用するGem
gem 'devise-bootstrap-views', '~> 1.0'
gem 'hamlit-rails', '~> 0.2.3'
gem 'html2haml', '~> 2.2.0'
gem 'omniauth'
gem 'omniauth-oauth2', '~> 1.7.0'
gem 'omniauth-github', '~> 1.4.0'
gem 'omniauth-rails_csrf_protection'
gem 'devise'
gem 'devise-i18n'

gem 'dotenv-rails'

gem 'rails-i18n', '~> 6.0.0'

#lineログイン
gem 'omniauth-line', '~> 0.1.0'

gem 'simple_calendar', '~> 2.0'

#ダミーデータ登録
gem 'faker'

#ページネーション
gem 'will_paginate'
gem 'will_paginate-bootstrap4'

#line-bot
# gem 'line-bot-api'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
  gem 'pry-byebug' 
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
