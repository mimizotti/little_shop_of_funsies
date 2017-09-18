class Admin::ItemsController < ApplicationController
before_action :require_admin
  def index
    @items = Item.all
  end
	
	def new
    @item = Item.new
	end
  
  def create
    @categories = Category.all
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_items_path
    else
      render :new
    end
  end

	private
  
  def item_params
    params.require(:item).permit(:title, :description, :price, :image, :category_id)
  end
  
	def require_admin
		render file: "/public/404" unless current_admin?
	end
end
