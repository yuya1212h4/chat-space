Rails.application.routes.draw do
  devise_for :users

  resources :groups, only: [:index]
  resources :messages, only: [:create]
end
