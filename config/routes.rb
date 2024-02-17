Rails.application.routes.draw do
  devise_for :users
  
  get "up" => "rails/health#show", as: :rails_health_check
  resources :events, only: [:index, :create]
  root to: "events#index" 
end
