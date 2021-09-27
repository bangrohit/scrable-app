Rails.application.routes.draw do
  resources :games
  resources :players
  root 'pages#index'
end
