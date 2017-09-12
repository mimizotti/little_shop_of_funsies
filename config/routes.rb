Rails.application.routes.draw do
  root :to => 'main#index'

  get '/login', :to => 'sessions#new', :as => 'login'

  resources :user, only: [:new]
end
