Rails.application.routes.draw do
  root 'events#index'
  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'
  get '/signin', to: 'user#show'
  delete '/signout', to: 'user#destroy'

  resources :user, only: [:new, :create, :show, :destroy]
  resources :events, only: [:new, :create, :show, :index]
end
