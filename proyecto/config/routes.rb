Rails.application.routes.draw do
  
  

  
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :clients
    end
  end

  

  resources :reminders
  resources :accountpayable_imports
  resources :accountreceivable_imports
  resources :client_imports
  resources :supplier_imports
  get 'admin/index'

  resources :rates
  resources :reports
  get 'graphs/index'
  get 'graphs/show_amountPaid'
  get 'graphs/show_clientsDebtors'
  get 'graphs/show_facilities'
  get 'graphs/show_accountTypes'

  resources :client_mails
  
  get 'setup/index'
  resources :search_suppliers
  resources :search_discounts
   resources :search_accountreceivables
    resources :search_accountpayables
  resources :search_clients
  resources :search_client_payments
  resources :discounts
  resources :mailreminders
  resources :accountpayables do
    collection { post :import }
  end
  resources :suppliers do
    collection { post :import }
  end
  resources :clients do
    resources :emails
    collection { post :import }
  end
  resources :accountreceivables do
      collection { post :import }
   end
  
  devise_for :users, {registrations: "registrations"}
  root 'principal#index'
  resources :users
  
end
