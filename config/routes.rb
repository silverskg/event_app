Rails.application.routes.draw do
  resources :posts
  post '/callback' => 'linebot#callback'
  # get "/auth/:provider/callback" => "sessions#callback"
  devise_for :users, controllers: {
    # omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations",
    omniauth_callbacks: "omniauth_callbacks"
    # sessions: "users/sessions"
  }
  resources :users
  resources :events
  root 'welcome#index'
  
  resource :retirements, only: %i[new create]

  resources :events do
    resources :tickets
  end
end
