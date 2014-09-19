Rails.application.routes.draw do

  resources :questions

  root 'questions#index'

  get 'welcome/question', to: 'welcome#question'

end
