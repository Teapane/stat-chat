StatChater::Application.routes.draw do

  get 'stats' => 'dashboard#index'

  root to: 'dashboard#index'
end
