Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: 'logout'

  root 'questions#index'

  resources :questions, shallow: true do
    resources :responses, shallow: true do
      resources :comments
    end
  end

  resources :users, only: [:create, :update, :show, :destroy]
  get '/signup' => 'users#new', as: 'signup'
end
