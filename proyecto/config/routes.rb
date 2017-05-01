Rails.application.routes.draw do
  
  resources :clients do
   resources :accountreceivables
  end  
  devise_for :users
  root 'clients#index'
end
