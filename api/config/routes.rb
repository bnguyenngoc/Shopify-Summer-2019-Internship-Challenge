Rails.application.routes.draw do
#  post '/query' => 'application#query'

  #for testing purposes
  get '/get' => 'products#get'
  post "/graphql", to: "graphql#execute"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
