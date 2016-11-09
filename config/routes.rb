Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'groups#index'

  resources :groups, only: :index do
    resources :messages, only: :create
  end
end
