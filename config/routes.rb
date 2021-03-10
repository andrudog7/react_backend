Rails.application.routes.draw do
  resources :votes
  resources :users_restaurants
  resources :comments
  resources :restaurants
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
