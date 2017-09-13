Rails.application.routes.draw do

  root :to => 'main#index'

  get '/login', :to => 'sessions#new', :as => 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'

  resources :users, only: [:new, :create]

  resources :dashboard, only: [:index]

resources :items, only: [:index, :show]
resources :categories, only: [:show]

end
