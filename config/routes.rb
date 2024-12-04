# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your applicaStion routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  root 'posts#index'

  resources :posts do
    scope module: :posts do
      resources :comments, only: %i[create]
      resources :likes, only: %i[create destroy]
    end
  end

  resources :users, only: [:show]
end
