Rails.application.routes.draw do
  devise_for :users

  resources :groups, only: :index do
    resources :messages, only: :create
  end
end
