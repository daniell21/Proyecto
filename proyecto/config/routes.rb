Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  
  resources :mailreminders
  resources :accountpayables
  resources :suppliers do
    collection { post :import }
  end
  resources :clients do
    resources :clientmails
    collection { post :import }
  end
  resources :accountreceivables
  
  devise_for :users, {registrations: "registrations"}
  #root 'clients#index'
  resources :users
  root 'principal#index'


end
