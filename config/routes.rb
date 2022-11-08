Rails.application.routes.draw do
  #get "users" => "users#index"
  #get "users/:id" => "users#show"
  resources :users, only: [:show, :index]

  get "users/:id/posts" => "posts#index"
 # resources :users do
 #   resources :posts, only: [:show]
 # end

 # get "users/:id/posts/:id" => "posts#show"
  resources :users do
    resources :posts
  end



end
