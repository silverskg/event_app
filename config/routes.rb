Rails.application.routes.draw do
  resources :posts
  post '/callback' => 'linebot#callback'
  # get "/auth/:provider/callback" => "sessions#callback"
  devise_for :users, controllers: {
    # omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations",
    omniauth_callbacks: "omniauth_callbacks",
    passwords: "users/passwords" #ゲスト
    # sessions: "users/sessions"
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  
  resources :users
  resources :events
  root 'welcome#index'
  
  resource :retirements, only: %i[new create]

  resources :events do
    resources :tickets
  end
end
