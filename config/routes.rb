Rails.application.routes.draw do
  root "rooms#home"
  get "/search", to: "rooms#search"
  get '/users/account' ,to: "users#account"
  get "/users/profile" ,to: "users#profile"
  devise_for :users
  resources :rooms 
  resources :reservations
  resources :users

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
