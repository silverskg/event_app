Rails.application.routes.draw do
  devise_for :users
  resources :events
  root 'welcome#index'
  get "/auth/:provider/callback" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  resource :retirements, only: %i[new create]

  resources :events do
    resources :tickets
  end
end
