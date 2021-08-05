Rails.application.routes.draw do
  root to: 'gossips#index'
  get '/team', to: 'team#index' 
  get '/contact', to: 'contact#index'
  get '/whoops', to: 'welcome#whoops'
  delete "/sessions", to: "sessions#destroy"
  delete "/delikes", to: "likes#delete"
  post "/likes", to: "likes#create" 
  resources :gossips
  resources :authors
  resources :cities
  resources :comments, only: [:update, :edit, :create, :destroy]
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create]
end
