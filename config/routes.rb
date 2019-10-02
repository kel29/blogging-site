Rails.application.routes.draw do
  get '/tags/:id', to: 'tags#show', as: 'tags'
  get '/users/:id', to: 'users#show', as: 'users'
  get '/like/:id', to: 'blogs#like', as: 'like'
  resources :blogs do
    post '/comments', to: 'comments#create', as: 'comments'
    delete '/comments/:id', to: 'comments#destroy', as: 'comment'
  end
  get '/login', to: 'auth#login', as: 'login'
  post '/login', to: 'auth#verify'
  get '/logout', to: 'auth#logout'
end
