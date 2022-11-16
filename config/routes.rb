Rails.application.routes.draw do
  devise_for :users

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
