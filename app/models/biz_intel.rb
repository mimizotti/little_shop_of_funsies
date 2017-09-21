class BizIntel

  def total_sales
    Order.shop_total_gross
  end

  def average_quantity_purchaced
    OrderItem.average_quantity
  end

  def completed_orders
    Order.count_of_completed_orders
  end

  def sales_by_item_title
    Item.total_sold_by_item
  end

  def status_for_items
    Item.items_by_title_with_status
  end

  def orders_per_customer
    User.user_orders
  end

  def items_ordered_per_customer
    User.user_quantity_of_items_ordered
  end

end
