Rails.application.routes.draw do

  root :to => 'main#index'

  get '/login', :to => 'sessions#new', :as => 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'

  resources :users, only: [:new, :create]
  
  resources :orders, only: [:index, :show]

  resources :dashboard, only: [:index]

  get '/cart', :to => 'carts#index', :as => 'cart'

  resources :items, only: [:index, :show]

  resources :carts, only: [:index, :create, :destroy]

  patch '/cart', :to => 'carts#update'

  delete '/cart', :to => 'carts#destroy'

  get '/:category', to: 'categories#show', param: :slug, as: "category"

end
