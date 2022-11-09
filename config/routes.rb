Rails.application.routes.draw do

  root "users#index"
  
  get "users" => "users#index"
  get "users/:id" => "users#show", as: "user"
  get "users/:id/posts" => "posts#index", as: "user_post"
  get "users/:id/posts/:id" => "posts#show", as: "post_detail"
end
