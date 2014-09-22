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
    resources :responses, shallow: true, except: :new do
      resources :comments
    end
  end

  post '/responses/:id/up_vote', to: "responses#up_vote", as: 'vote_up_response'
  post '/responses/:id/mark_as_best', to: 'responses#mark_as_best', as: 'mark_best_response'

end
