Rails.application.routes.draw do
  get 'carts/create'

  get 'carts/destroy'

  get 'cart_items/create'

  get 'cart_items/destroy'

  post '/query' => 'products#query'
  post "/graphql", to: "graphql#execute"


  #REST API
  get '/get' => 'products#get'
  get '/get/available' => 'products#get_available'
  get '/get/:id' => 'products#get_one'
  put '/purchase/:id' => 'products#purchase_one'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
