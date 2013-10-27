Musecruise::Application.routes.draw do
  
  devise_for :users, controllers: { 
    confirmations: 'confirmations', 
    registrations: 'registrations'
  }

  devise_scope :user do
    patch '/confirm' => 'confirmations#confirm'
    root to: "tours#new"
  end
  
  resources :users

  resources :tours

  get   'pages/index', to: 'pages#index'
  
  # root  'pages#home'

  # unauthenticated do
  #   root to: "registrations#new", :as => "unauthenticated"
  # end
  
end
