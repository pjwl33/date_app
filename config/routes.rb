Rails.application.routes.draw do
 root 'sessions#index'

 get '/auth/:provider/callback' => 'sessions#create', as: 'oauth'
 get '/auth/failure' => redirect('/')

 post '/dislikes' => 'dislikes#create'
 get '/dislikes/new' => 'dislikes#new'

 post '/matches' => 'matches#create'
 delete '/matches' => 'matches#destroy'

 get '/users' => 'users#index'
 get '/users/:id' => 'users#show', as: 'user'

 get '/signout' => 'sessions#destroy', as: 'signout'
end
