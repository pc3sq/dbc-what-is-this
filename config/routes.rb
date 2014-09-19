Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/question', to: 'welcome#question'

end
