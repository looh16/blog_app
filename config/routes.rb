Rails.application.routes.draw do

  root "users#index"
  
  resources :users do 
    resources :posts do
    end
  end 

  resources :posts do
    resources :comments 
    resources :likes , only: [:create]
 end


end
