Rails.application.routes.draw do

  root :to => 'main#index'

  get '/login', :to => 'sessions#new', :as => 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'

  resources :users, only: [:new, :create]

  resources :dashboard, only: [:index]


resources :items, only: [:index, :show]

resources :carts, only: [:index, :create, :destroy]
get '/:category', to: 'categories#show', param: :slug, as: "category"
end
