Rails.application.routes.draw do
  devise_for :users
  get '/chat_groups' => 'group#index'
  post '/chat_groups' => 'group#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
