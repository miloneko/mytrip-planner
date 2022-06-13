Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  root to: 'static_pages#top'
  get 'about', to: 'about#show'
  get 'privacy', to: 'static_pages#privacy'
  get 'terms', to: 'static_pages#terms'
  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'



  namespace :admin do
    resources :users, only: %i[index edit destroy]
  end
  resources :plans
  resources :password_resets, only: %i[new create edit update]
  resource :profile, only: %i[show edit update]
  resources :likes, only: %i[create destroy]
  resources :posts do
    resources :likes, only: %i[create destroy]
    collection do
      get 'search'
      get :likes
  end
  resources :comments, only: %i[create destroy]
 end
 

  post 'oauth/callback', to: 'oauths#callback'
  get 'oauth/callback', to: 'oauths#callback'
  get 'oauth/:provider', to: 'oauths#oauth', as: :auth_at_provider
end
