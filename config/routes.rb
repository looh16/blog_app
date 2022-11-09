Rails.application.routes.draw do
  get "users" => "users#index"
  get "users/:id" => "users#show", as: "user"
  get "users/:id/posts" => "posts#index", as: "user_post"
  get "users/:id/posts/:id" => "posts#show"
end
