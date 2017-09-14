Rails.application.routes.draw do

  root :to => 'main#index'

  get '/login', :to => 'sessions#new', :as => 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'

  resources :users, only: [:new, :create]

  resources :dashboard, only: [:index]

  get '/cart', :to => 'carts#index', :as => 'cart'

  resources :items, only: [:index, :show]

<<<<<<< HEAD
<<<<<<< HEAD
=======
resources :carts, only: [:index, :create, :destroy]
get '/:category', to: 'categories#show', param: :slug, as: "category"
=======
>>>>>>> orders
  resources :carts, only: [:index, :create]

  patch '/cart', :to => 'carts#increase'

  put '/cart', :to => 'carts#decrease'

  delete '/cart', :to => 'carts#destroy'

  get '/:category', to: 'categories#show', param: :slug, as: "category"



<<<<<<< HEAD
=======
resources :carts, only: [:index, :create, :destroy]
get '/:category', to: 'categories#show', param: :slug, as: "category"
>>>>>>> orders
=======
>>>>>>> 4900e9037b9832b31d31c9da1407e68b1a83cd9d
>>>>>>> orders
end
