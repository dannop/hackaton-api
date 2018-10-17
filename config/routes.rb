Rails.application.routes.draw do
  resources :achievments
  resources :links
  resources :topics
  resources :categories
  resources :users
  
  
  get '/topics/:topic_id/show_dislike/:user_id', to: 'topics#show_dislike'
  get '/topics/:topic_id/show_like/:user_id', to: 'topics#show_like'

  patch '/topics/:topic_id/dislike/:user_id', to: 'topics#dislike'
  patch '/topics/:topic_id/like/:user_id', to: 'topics#like'

  get '/users/:user_id/liked_topics', to: 'users#liked_topics'

  get '/random_topics', to: 'topics#rand_topic'

  get '/topics/:topic_id/comments', to: 'topics#comment_index'
  post '/topics/:topic_id/comments', to: 'topics#comment_create'
  delete '/topics/:topic_id/comments/:comment_id', to: 'topics#comment_delete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end