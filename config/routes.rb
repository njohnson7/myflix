# config/routes.rb

Rails.application.routes.draw do
  ActiveSupport::Deprecation.silence do
    get 'ui(/:action)', controller: 'ui'
  end

  root to: 'pages#front'

  get 'home',   to: 'categories#index'
  get 'videos', to: 'categories#index'

  resources :videos, only: [:show] do
    collection do
      get 'search'
    end

    resources :reviews, only: [:create]
  end

  resources :categories, only: [:index, :show]

  get 'register',        to: 'users#new'
  get 'register/:token', to: 'users#new_with_invitation_token', as: 'register_with_token'
  resources :users, only: [:create, :show]

  get    'sign_in',  to: 'sessions#new'
  post   'sign_in',  to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'
  # get 'sign_out',

  get  'my_queue',     to: 'queue_items#index'
  post 'update_queue', to: 'queue_items#update_queue'

  resources :queue_items, only: [:create, :destroy]

  get 'people', to: 'relationships#index'
  resources :relationships, only: [:create, :destroy]

  get 'forgot_password', to: 'forgot_passwords#new'
  resources :forgot_passwords, only: [:create]
  get 'forgot_password_confirmation', to: 'forgot_passwords#confirm'

  resources :password_resets, only: [:show, :create]
  get 'expired_token', to: 'pages#expired_token'

  resources :invitations, only: [:new, :create]
end
