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
  get 'rooms/show'
  get 'welcome/home'
  resources :rooms, only: %i[show]

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  
  resources :users
  resources :events
  root 'welcome#index'
  
  resource :retirements, only: %i[new create]

  resources :events do
    resources :tickets
    member do
      post '/ticket/:event_id' => 'tickets#ticket', as: 'ticket'
      delete '/ticket/:event_id' => 'tikets#unticket', as: 'unticket'
    end
  end
end
