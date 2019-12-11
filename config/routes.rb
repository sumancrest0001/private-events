Rails.application.routes.draw do
  root 'events#index'

  get '/signup', to: 'user#new'
  post '/signup', to: 'user#create'
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'

  resources :user, only: [:new, :create, :show, :destroy]
  resources :events, only: [:new, :create, :show, :index]
  resources :sessions, only: [:new, :create, :destroy]
end
