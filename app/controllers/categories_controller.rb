class CategoriesController < ApplicationController
	def show
			@categories = Category.friendly.find(params[:category])
	end
end
