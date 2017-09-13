class CategoriesController < ApplicationController
	def show
		binding.pry
		@category = Category.friendly.find(params[:category])
	end
end