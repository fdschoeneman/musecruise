Musecruise::Application.routes.draw do

  devise_for :users

  resources :tours
  get 'pages/index', to: 'pages#index'
  root 'pages#home'
end
