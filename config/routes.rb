Rails.application.routes.draw do
  root to: "home#index"

  resources :users, only: [:index, :new]
  devise_for :users
end
