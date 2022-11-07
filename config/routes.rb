Rails.application.routes.draw do
  get "users" => "users#index"
  get "users/:id" => "users#show"
  get "users/:id/posts" => "posts#index"
  get "users/:id/posts/:id" => "posts#show"
end
