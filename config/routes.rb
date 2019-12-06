Rails.application.routes.draw do

  get 'event/new'

  get 'event/create'

  get 'event/show'

  resources :user, only: [:new, :create, :show]
end
