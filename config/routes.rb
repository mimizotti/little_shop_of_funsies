Rails.application.routes.draw do
  root :to => 'main#index'

  get '/login', :to => 'sessions#new', :as => 'login'
  get '/dashboard', :to => 'users#show', :as => 'dashboard'

  resources :users, only: [:new, :create]
end
