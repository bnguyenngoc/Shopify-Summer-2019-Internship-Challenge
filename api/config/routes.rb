Rails.application.routes.draw do
  
  #GRAPHQL
  post '/query' => 'products#query'
  post "/graphql", to: "graphql#execute"


  #REST API

  # Routes for Product
  get '/products' => 'products#index'
  get '/products/:id' => 'products#show'
  put '/purchase/:id' => 'products#purchase_one'

  # Routes for Cart
  resources :carts, only: [:show, :create, :update, :destroy]

  # Routes for Cart item
  resources :cart_items, :except => [:create, :edit, :update]
  post '/cart_items/:id' => 'cart_items#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
