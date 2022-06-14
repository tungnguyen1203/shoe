Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#index"
  get  "/about", to: "home#about"
  get  "/contact", to: "home#contact"
  resources :products
  resources :home
  namespace :admin do
    resources :dashboard
  end
  resources :order_details
  post 'order_details' => "order_details#create"
  resources :orders
  resources :carts
  
  
end
