Rails.application.routes.draw do

  root :to => 'main#index'

  get '/login', :to => 'sessions#new', :as => 'login'
  post '/login', :to => 'sessions#create'
  delete '/logout', :to => 'sessions#destroy'

  namespace :admin do
    resources :dashboards, only: [:index]
  end

  resources :users, only: [:new, :create]
  
  resources :orders, only: [:index, :show]

  resources :dashboard, only: [:index]

  get '/cart', :to => 'carts#index', :as => 'cart'

  resources :items, only: [:index, :show]
<<<<<<< HEAD
  patch '/cart', :to => 'carts#increase'

  put '/cart', :to => 'carts#decrease'
=======

  resources :carts, only: [:index, :create, :destroy]

  patch '/cart', :to => 'carts#update'
>>>>>>> 3fece5a663c9393a19a200d5abf0e5ff3d09880d

  delete '/cart', :to => 'carts#destroy'
  resources :carts, only: [:index, :create, :destroy]

  get '/:category', to: 'categories#show', param: :slug, as: "category"
<<<<<<< HEAD

end
=======
>>>>>>> 3fece5a663c9393a19a200d5abf0e5ff3d09880d

end
