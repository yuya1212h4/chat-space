Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'groups#index'

  resources :groups, only: [:edit, :new, :create, :update] do
    resources :messages, only: [:new,:create]
  end
end
