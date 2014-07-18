Rails.application.routes.draw do
 root 'sessions#index'
 get '/auth/:provider/callback' => 'sessions#create'
 get '/auth/failure' => redirect('/')

 post '/dislikes' => 'dislikes#create'
 get '/dislikes/new' => 'dislikes#new'

 get '/signout' => 'sessions#destroy', as: 'signout'
end
