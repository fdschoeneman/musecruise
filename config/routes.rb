Musecruise::Application.routes.draw do
  
  devise_for :users, controllers: { 
    confirmations: 'confirmations', 
    registrations: 'registrations'
  }

  devise_scope :user do
    put '/confirm' => 'confirmations#confirm'
  end
  
  resources :users

  resources :tours

  get   'pages/index', to: 'pages#index'
  
  root  'pages#home'
  
end
