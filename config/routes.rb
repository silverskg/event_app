Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "users/registrations",
    # sessions: "users/sessions"
  }
  resources :events
  root 'welcome#index'
  
  
  # get "/auth/:provider/callback" => "sessions#create"
  resource :retirements, only: %i[new create]

  resources :events do
    resources :tickets
  end
end
