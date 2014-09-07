Rails.application.routes.draw do
 root 'sessions#index'

 get '/auth/:provider/callback' => 'sessions#create', as: 'oauth'
 get '/auth/failure' => redirect('/')

 post '/dislikes' => 'dislikes#create'
 get '/dislikes/new' => 'dislikes#new'

 post '/match_request' => 'matches#match_request'
 post '/match_confirm' => 'matches#match_confirm'
 get '/matches' => 'matches#index'

 get '/users' => 'users#index'
 get '/users/:id' => 'users#show', as: 'user'

 get '/signout' => 'sessions#destroy', as: 'signout'
end
