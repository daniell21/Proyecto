Rails.application.routes.draw do
  
  

  resources :accountpayables
  resources :suppliers do
    collection { post :import }
  end
  resources :clients do
    collection { post :import }
  end
  resources :accountreceivables
  
  devise_for :users, {registrations: "registrations"}
  #root 'clients#index'
  root 'principal#index'
end
