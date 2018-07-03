Rails.application.routes.draw do
  ActiveSupport::Deprecation.silence do
    get 'ui(/:action)', controller: 'ui'
  end

  root           to: 'categories#index'
  get '/home',   to: 'categories#index'
  get '/videos', to: 'categories#index'

  resources :videos,     only: [:show]
  resources :categories, only: [:index, :show]
end
