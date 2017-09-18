class Admin::ItemsController < ApplicationController
before_action :require_admin
  def index
    @items = Item.all
  end
	
	def new
    @item = Item.new
	end
  
  def create
    @item = Item.new(item_params)
    redirect_to admin_items_path
  end

	private
  
  def item_params
    params.require(:item).permit(:title, :description, :price, :image)
  end
  
	def require_admin
		render file: "/public/404" unless current_admin?
	end
end
