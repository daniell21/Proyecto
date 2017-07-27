Rails.application.routes.draw do
  
  

  
  resources :client_mails
  resources :groups
  
  get 'setup/index'
  resources :search_suppliers
  resources :search_discounts
  resources :search_clients
 
  resources :discounts
  resources :payments
  resources :mailreminders
  resources :accountpayables
  resources :suppliers do
    collection { post :import }
  end
  resources :clients do
    collection { post :import }
  end
  resources :accountreceivables do
      collection { post :import }
   end
  
  devise_for :users, {registrations: "registrations"}
  root 'principal#index'
  resources :users
  #root 'principal#index'
end
