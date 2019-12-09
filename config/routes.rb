Rails.application.routes.draw do


  resources :user, only: [:new, :create, :show]
  resources :events, only: [:new, :create, :show, :index]
end
