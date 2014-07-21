Rails.application.routes.draw do
 root 'sessions#index'
 get '/auth/:provider/callback' => 'sessions#create'
 get '/auth/failure' => redirect('/')

 post '/dislikes' => 'dislikes#create'
 post '/matches' => 'matches#create'
 delete '/matches' => 'matches#destroy'
 get '/dislikes/new' => 'dislikes#new'
 get '/users' => 'users#index'
 get '/users/:id' => 'users#show'

 get '/signout' => 'sessions#destroy', as: 'signout'
end
