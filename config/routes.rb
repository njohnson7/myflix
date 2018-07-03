Rails.application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root           to: 'categories#index'
  get '/home',   to: 'categories#index'
  get '/videos', to: 'categories#index'

  resources :videos, only: [:show]
  resources :categories, only: [:index, :show]
end
