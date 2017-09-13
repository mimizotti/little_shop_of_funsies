Rails.application.routes.draw do
	resources :items, only: [:index, :show]
	resources :categories, only: [:show]
end
