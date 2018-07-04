Rails.application.routes.draw do
  ActiveSupport::Deprecation.silence do
    get 'ui(/:action)', controller: 'ui'
  end

  root           to: 'categories#index'
  get '/home',   to: 'categories#index'
  get '/videos', to: 'categories#index'

  resources :videos, only: [:show] do
    collection do
      get 'search'
    end
  end

  resources :categories, only: [:index, :show]
end
