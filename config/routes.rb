Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'

  root 'questions#index'

  resources :questions

  resources :users, only: [:create, :update, :show, :destroy]
  get '/signup' => 'users#new', as: 'signup'
end
