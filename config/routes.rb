StatChater::Application.routes.draw do

  get 'stats' => 'dashboard#index'

  # Should be refactored when user model is built
  get 'profile' => 'dashboard#profile'

  root to: 'dashboard#index'
end
