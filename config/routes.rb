StatChater::Application.routes.draw do

  get 'stats' => 'dashboard#index'

  # Should be refactored when user model is built
  # get 'profile' => 'dashboard#profile'
  resources :users, only: [:show]

  get 'login' => 'sessions#new'
  get '/auth/:provider/callback' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  root to: 'dashboard#index'
end
