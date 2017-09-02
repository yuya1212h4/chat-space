Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  root 'groups#index'

  resources :groups, only: [:new, :create, :edit, :update], shallow: true do
    resources :messages, only: [:new, :create]
  end

  resources :users, only: [] do
    get 'search', on: :collection
  end
end
