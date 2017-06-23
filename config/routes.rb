Rails.application.routes.draw do
  root 'sessions#index'
  post '/sessions' => 'sessions#create'
  get '/logout' => 'sessions#destroy'    
  
  post '/users' => 'users#create'
  get '/users/:id' => 'users#show'    
  
  get '/shoes' => 'shoes#index'
  post '/shoes' => 'shoes#create'
  post '/shoes/:id' => 'shoes#update'
  get '/delete/:id' => 'shoes#destroy'
  post '/delete/:id' => 'shoes#destroy'
end
