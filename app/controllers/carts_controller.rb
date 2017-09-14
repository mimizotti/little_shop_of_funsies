class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
    @items = @cart.item_and_quantity
  end

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_back(fallback_location: root_path)
  end

  def update
    item_id = params[:format]
    condition = params[:condition]
    @cart.item_quantity(item_id, condition)
    redirect_to cart_path
  end

  def destroy
    item = Item.find(params[:id])
    @cart.contents.delete(params[:id])
    flash[:successfully_removed] = "Successfully removed <a href=#{item_path(item)}>#{item.title}</a> from your cart."
    redirect_back(fallback_location: root_path)
  end
end
