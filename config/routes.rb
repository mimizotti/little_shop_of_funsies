Rails.application.routes.draw do
  root :to => 'main#index'

  get '/login', :to => 'sessions#new', :as => 'login'

  resources :users, only: [:new]
end
