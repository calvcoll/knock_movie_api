Rails.application.routes.draw do
  resources :reviews
  resources :movies
  resources :genres
  post 'user_token' => 'user_token#create'
  post 'sign_up' => 'user#sign_up'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
