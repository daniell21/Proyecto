Rails.application.routes.draw do
  
  

  
  get 'setup/index'

  resources :discounts
  resources :payments
  resources :mailreminders
  resources :accountpayables
  resources :suppliers do
    collection { post :import }
  end
  resources :clients do
  	resources :clientmails
    collection { post :import }
  end
  resources :accountreceivables do
      collection { post :import }
   end
  
  devise_for :users, {registrations: "registrations"}
  root 'clients#index'
  resources :users
  #root 'principal#index'
end
