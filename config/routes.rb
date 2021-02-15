Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
# get '/users/:id', to: 'users#show'
root to: 'sessions#welcome'
get 'auth/:provider/callback', to: 'sessions#omniauth'

#sessions
get '/login', to: 'sessions#new'
post '/login', to: 'sessions#create'

delete '/logout', to: 'sessions#destroy'

get '/signup', to: 'users#new'
post '/signup', to: 'users#create'

resources :reviews 

# resources :users, only: [:show, :new, :create]

resources :users, only: [:show, :new, :create] do
    resources :reviews
end


resources :playlists do
  resources :reviews
end


end
