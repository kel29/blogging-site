Rails.application.routes.draw do
  get '/tags/:id', to: 'tags#show', as: 'tags'
  resources :comments
  resources :blogs
  resources :users
end
