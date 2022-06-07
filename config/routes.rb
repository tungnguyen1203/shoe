Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get  "/about", to: "home#about"
  get  "/contact", to: "home#contact"
  resources :products
  resources :home
  resources :order_details
  post 'order_details' => "order_details#create"
  resources :orders
  resources :carts
  # resources :check_out
  post 'check_out/create',to: "check_out#create"
  
end
