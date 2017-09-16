class OrdersController < ApplicationController
	before_action :require_current_user

	def index
		@user = current_user
		@user.orders.preload(:items)
	end

	def show
		@order = Order.find(params[:id])
		if current_user.id != @order.user_id
			redirect_to dashboard_index_path
		end
	end

	def new
		order = Order.create(status: "ordered", user_id: current_user.id)
		item_hash = @cart.item_and_quantity
		order.add(item_hash)
		@cart.destroy
		flash[:success] = "Order was successfully placed"
		redirect_to orders_path
	end

	private
		def require_current_user
			redirect_to login_path unless current_user
		end

end
