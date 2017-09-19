class MainController < ApplicationController
  def index
    @popular_items = OrderItem.top_three_items
  end
end
