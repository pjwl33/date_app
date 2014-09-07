Rails.application.routes.draw do
 root 'sessions#index'

 get '/auth/:provider/callback' => 'sessions#create', as: 'oauth'
 get '/auth/failure' => redirect('/')

 post '/dislikes' => 'dislikes#create'
 get '/dislikes/new' => 'dislikes#new'

 post '/match_request' => 'matches#match_request'
 post '/match_deny_confirm' => 'matches#match_deny_confirm'
 get '/matches' => 'matches#index'

 get '/users' => 'users#index'
 get '/users/:id' => 'users#show', as: 'user'

 get '/start_chatting' => 'chatrooms#start_chatting'
 get '/chatrooms/:id' => 'chatrooms#show'

 get '/signout' => 'sessions#destroy', as: 'signout'
end
