Rails.application.routes.draw do
  root to: "home#index"

  resources :users, only: [:index, :new, :create]
  devise_for :users
end
