Rails.application.routes.draw do
  root :to => 'main#index'

  get '/login', :to => 'sessions#new', :as => 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'
  # get '/dashboard', :to => 'users#show', :as => 'dashboard'

  resources :users, only: [:new, :create]

  resources :dashboard, only: [:index]

  # namespace :dashboard do
  #   resources :user, only: [:show]
  # end

  # scope(path_names: { show: ('dashboard')}) do
  #   resources :users, path: 'dashboard', only: :show
  # end
  #
  # resources :users, only: [:show] do
  #   collection do
  #     get :dashboard
  #   end
  # end

end
