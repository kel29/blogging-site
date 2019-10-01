Rails.application.routes.draw do
  get '/tags/:id', to: 'tags#show', as: 'tags'
  get '/users/:id', to: 'users#show', as: 'users'
  get '/like/:id', to: 'blogs#like', as: 'like'
  resources :blogs do
    resources :comments, only: [:create, :destroy]
  end
end
