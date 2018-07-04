Rails.application.routes.draw do
  ActiveSupport::Deprecation.silence do
    get 'ui(/:action)', controller: 'ui'
  end

  root to: 'application#index'

  get '/home',   to: 'categories#index'
  get '/videos', to: 'categories#index'

  resources :videos, only: [:show] do
    collection do
      get 'search'
    end
  end

  resources :categories, only: [:index, :show]


  get 'register', to: 'users#new'
  resources :users, only: [:create]

  get 'login',   to: 'sessions#new'
  post 'login',  to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'
end
