Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'groups#index'
  get 'search' => 'groups#search'

  resources :groups, only: [:new, :create, :edit, :update], shallow: true do
    resources :messages, only: [:new, :create]
  end
end
