# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your applicaStion routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  root "posts#index"

  resources :posts, only: [:new, :create, :show] do
    scope module: :posts do
      resources :comments
      resources :likes, only: :create
      resources :likes, only: :destroy      
    end
  end

  


  

  # Defines the root path route ("/")
  # root "posts#index"
end
