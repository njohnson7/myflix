Rails.application.routes.draw do
  ActiveSupport::Deprecation.silence do
    get 'ui(/:action)', controller: 'ui'
  end

  root to: 'pages#front'

  get '/home',   to: 'categories#index'
  get '/videos', to: 'categories#index'

  resources :videos, only: [:show] do
    collection do
      get 'search'
    end

    resources :reviews, only: [:create]
  end

  resources :categories, only: [:index, :show]


  get 'register', to: 'users#new'
  resources :users, only: [:create]

  get    'sign_in',  to: 'sessions#new'
  post   'sign_in',  to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'

  get 'my_queue', to: 'queue_items#index'

  resources :queue_items, only: [:create]
end
