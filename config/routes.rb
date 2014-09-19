Rails.application.routes.draw do

  resources :comments
  resources :questions

  root 'welcome#index'

  get 'welcome/question', to: 'welcome#question'

end
