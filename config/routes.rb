Rails.application.routes.draw do
  devise_for :users

  resources :group, only: [:index, :create]

end
