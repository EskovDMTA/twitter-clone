Rails.application.routes.draw do

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :tweets, only: [:create, :show] do
    resources :likes, only: [:create, :destroy]
    resources :bookmarks, only: [:create, :destroy]
    resources :retweets, only: [:create, :destroy]
    resources :reply_tweets, only: [:create]
  end

  # resources :tweets, only: :create
  get :dashboard, to: "dashboard#index"
  get :profile, to: "profile#show"
  patch :profile, to: "profile#update"

  resources :usernames, only: [:new, :update]
end
