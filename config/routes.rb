Rails.application.routes.draw do
  root to: "home#index"

  get "not_found" => "home#not_found"

  get "email" => "users#email"
  get "password/:reset_password_token" => "users#password"
  post "destroy_password/" => "users#destroy_password"
  post "update_password" => "users#update_password"

  resources :users, only: [:index, :new, :create]
  devise_for :users
end
