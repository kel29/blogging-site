Rails.application.routes.draw do
  get '/tags/:id', to: 'tags#show', as: 'tags'
  get '/users/:id', to: 'users#show', as: 'users'
  get '/like/:id', to: 'blogs#like', as: 'like'
  resources :blogs do
    post '/comments', to: 'comments#create', as: 'blog_comments'
    post '/comments/:id', to: 'comments#destroy'
  end
end
