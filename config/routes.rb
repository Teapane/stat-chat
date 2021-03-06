require 'resque/server'

StatChater::Application.routes.draw do

  mount Resque::Server.new, at: "/resque"

  get 'stats' => 'dashboard#index'

  # Should be refactored when user model is built
  # get 'profile' => 'dashboard#profile'
  resources :users, only: [:show]

  get 'login' => 'sessions#new'
  get '/auth/:provider/callback' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  resources :calculators, only: [:index]

  root to: 'dashboard#index'
end
