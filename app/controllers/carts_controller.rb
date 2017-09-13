class CartsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    flash[:notice] = "You now have 1 #{item.title}."
    redirect_to items_path
  end
end
