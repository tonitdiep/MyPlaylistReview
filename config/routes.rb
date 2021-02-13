Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# get '/users/:id', to: 'users#show'
root to: 'sessions#welcome'
  #sessions
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
# delete '/logout', to: 'sessions#destroy'

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
resources :reviews 

  resources :users do
    resources :playlists
end


resources :playlists do
  resources :reviews
end

# get 'auth/:provider/callback', to: 'sessions#omniauth'
# namespace :user do 
#   resources :playlists, :reviews
# end





end
