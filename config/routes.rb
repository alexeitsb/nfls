Rails.application.routes.draw do
  root to: "home#index"

  get "password/:reset_password_token" => "users#password"

  resources :users, only: [:index, :new, :create]
  devise_for :users
end
