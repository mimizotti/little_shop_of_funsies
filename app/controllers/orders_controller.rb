class OrdersController < ApplicationController
	def index
		@user = current_user
		@user.orders.preload(:items)
	end
end