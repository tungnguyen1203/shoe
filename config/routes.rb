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
    resources :products
    resources :categories
    resources :orders
    resources :customers
  end
  resources :order_details
  post 'order_details' => "order_details#create"
  post 'order_details/:id/add' => "order_details#add_quantity", as: "order_detail_add"
  post 'order_details/:id/reduce' => "order_details#reduce_quantity", as: "order_detail_reduce"
  resources :orders
  resources :carts
  
end
