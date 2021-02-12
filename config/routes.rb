Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :users, except: [:new]
# resources :playlists
# resources :reviews

# resources :reviews do 
#   resources :playlists
# end
#playlists index, show, new, create, udpate, delete
#reviews index, show, new, create, udpate, delete

# get 'auth/:provider/callback', to: 'sessions#omniauth'

#sessions
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'
# delete '/logout', to: 'sessions#destroy'

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'
get '/users/:id', to: 'users#show'
root to: 'sessions#welcome'


end
