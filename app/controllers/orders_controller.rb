class OrdersController < ApplicationController
	def index
		@user = current_user
		@user.orders.preload(:items)
	end

	def show
		@order = Order.find(params[:id])
	end

	def new
		address = Address.find(params[:user][:addresses])
		order = Order.create(status: "ordered", user_id: current_user.id, address: address.complete_address)
		item_hash = @cart.item_and_quantity
		order.add(item_hash)
		@cart.destroy
		flash[:success] = "Order was successfully placed"
		redirect_to orders_path
	end

end
