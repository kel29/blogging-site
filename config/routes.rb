Rails.application.routes.draw do
  get '/tags/:id', to: 'tags#show', as: 'tags'
  resources :users, only: [:show, :new, :create, :edit, :update]
  get '/users/:id/bio', to: "users#bio", as: 'bio'
  get '/users/:id/resume', to: "users#resume", as: 'resume'
  get '/like/:id', to: 'blogs#like', as: 'like'
  resources :blogs do
    post '/comments', to: 'comments#create', as: 'comments'
    delete '/comments/:id', to: 'comments#destroy', as: 'comment'
  end
  get '/login', to: 'auth#login', as: 'login'
  post '/login', to: 'auth#verify'
  get '/logout', to: 'auth#logout'
end
