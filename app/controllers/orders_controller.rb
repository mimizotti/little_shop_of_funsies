class OrdersController < ApplicationController
	def index
		@user = current_user
		@user.orders.preload(:items)
	end
	
	def show
		@order = Order.find(params[:id])
	end
end