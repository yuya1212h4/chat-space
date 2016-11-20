Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root 'groups#index'

  resources :groups, except: [:index, :show, :destroy], shallow: true do
    resources :messages, only: [:new,:create]
  end
end
