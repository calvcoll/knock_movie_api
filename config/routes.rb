Rails.application.routes.draw do
  resources :reviews
  resources :movies
  resources :genres
  post 'user_token' => 'user_token#create'
  post 'sign_up' => 'user#sign_up'
  get 'movie_top_reviews/:id' => 'movie_methods#top5'
  get 'movie_reviews/:id' => 'movie_methods#reviews'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
