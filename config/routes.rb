Musecruise::Application.routes.draw do
  
  devise_for :users, controllers: { 
    confirmations: 'confirmations', 
    registrations: 'registrations'
  }

  devise_scope :user do
    patch '/confirm' => 'confirmations#confirm'
  end

  resources :users do
    resources :tours
  end

  resources :tours

  patch   'rate_my_tour',         to: 'tours#rate'
  get   'pages/index',  to: 'pages#index'
  
  root  'pages#home'
  
end
