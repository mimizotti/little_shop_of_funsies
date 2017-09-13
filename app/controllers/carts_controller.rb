class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents

    flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)}."
    redirect_to items_path
    # id = params[:item_id].to_s
    # item = Item.find(id)
    # session[:cart] ||= {}
    # session[:cart][id] = (session[:cart][id] || 0) + 1
    # flash[:notice] = "You now have #{pluralize(session[:cart][id], item.title)}."
    # redirect_to items_path
  end
end
