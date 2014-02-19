StatChater::Application.routes.draw do

  get 'stats' => 'dashboard#index'

  # Should be refactored when user model is built
  get 'profile' => 'dashboard#profile'

  get 'login' => 'sessions#new'

  root to: 'dashboard#index'
end
