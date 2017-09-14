class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def total_count
    contents.values.sum
  end

  def add_item(id)
    contents[id.to_s] = (contents[id.to_s] || 0) + 1
  end

  def item_quantity(id, condition)
    if condition == "decrease"
      if contents[id.to_s] > 0
        contents[id.to_s] -=1
      end
    elsif condition == "increase"
      contents[id.to_s] += 1
    end
  end

  def count_of(id)
    contents[id.to_s].to_i
  end

  def item_and_quantity
    items = {}
    contents.each do |item_id, quantity|
      items[Item.find(item_id)] = quantity
    end
    items
  end

  def delete_item(id)
    contents.delete(id)
  end

end
