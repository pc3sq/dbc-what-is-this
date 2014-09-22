Rails.application.routes.draw do

  root 'questions#index'

  resources :sessions, only: [:create, :destroy]
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy', as: 'logout'

  resources :oauths, only: [:create]
  get '/google_login' => 'oauths#new', as: 'google_login'
  get '/callback' => 'oauths#callback'

  resources :users, except: [:new, :index]

  resources :questions, shallow: true do
    resources :responses, shallow: true do
      resources :comments
    end
  end

  post '/response/up_vote' => "responses#up_vote"
  post '/responses/:id', to: 'responses#mark_as_best', as: 'mark_best_response'

end
