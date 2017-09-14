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

  def increase
    item_id = params[:format]
    @cart.increase_quantity_item(item_id)
    redirect_to '/cart'
  end

  def decrease
    item_id = params[:format]
    @cart.decrease_quantity_item(item_id)
    redirect_to '/cart'
  end

  def destroy
    item = Item.find(params[:id])
    @cart.contents.delete(params[:id])
    flash[:successfully_removed] = "Successfully removed <a href=#{item_path(item)}>#{item.title}</a> from your cart."
    redirect_back(fallback_location: root_path)
  end
end
