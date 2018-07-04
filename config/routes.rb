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
end



=begin

videos#show page
  - add user reviews section
    - add table
      - migration
        - :rating
        - :body
        - :user   (1:M)
        - :video  (1:M)
        - :timestamps
  - tests:
    - fabricate reviews
    - set as instance vars (...?)
    - reverse chronological order (most recent at top)
    - average rating for a video under the title
      - avg of all the reviews
      - 1 digit after decimal (ex: 4.3)

=end

