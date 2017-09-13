class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    id = params[:item_id].to_s
    item = Item.find(id)
    session[:cart] ||= {}
    session[:cart][id] = (session[:cart][id] || 0) + 1
    flash[:notice] = "You now have #{pluralize(session[:cart][id], item.title)}."
    redirect_to items_path
  end
end
