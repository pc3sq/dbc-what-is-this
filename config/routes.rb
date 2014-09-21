Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  resources :oauths, only: [:create]
  get '/google_login' => 'oauths#new', as: 'google_login'
  get '/callback' => 'oauths#callback'

  root 'questions#index'

  resources :questions, shallow: true do
    resources :responses, shallow: true do
      resources :comments
    end
  end

  resources :users, except: :index
  get '/signup' => 'users#new', as: 'signup'

  post '/response/up_vote' => "responses#up_vote"

end
