Rails.application.routes.draw do
  resources :achievments
  resources :links
  resources :topics
  resources :categories
  resources :users
  
  get '/topics/:topic_id/comments', to: 'topics#comment_index'
  post '/topics/:topic_id/comments/:comment_id', to: 'topics#comment_create'
  delete '/topics/:topic_id/comments/:comment_id', to: 'topics#comment_delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
