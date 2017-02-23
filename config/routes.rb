Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'groups#index'

  resources :groups, only: [:new, :create, :edit, :update], shallow: true do
    resources :messages, only: [:new, :create]
  end

  namespace :users do
    get 'search'
  end
end
