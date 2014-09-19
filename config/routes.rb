Rails.application.routes.draw do

  resources :questions

  root 'welcome#index'

  get 'welcome/question', to: 'welcome#question'

end
