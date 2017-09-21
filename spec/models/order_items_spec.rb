require 'rails_helper'

describe "order item methods" do
  before(:each) do
    more_orders
  end

  it "can return the sum of all quantity" do
    quantity_hash = OrderItem.sum_quantity.all.count
    expected_result = {8=>1, 1=>1, 5=>1, 11=>1, 3=>1, 12=>1, 9=>1, 7=>1}
    expect(quantity_hash).to eq(expected_result)
  end

  it "can return top three items" do
    expect(OrderItem.top_three_items.count).to eq(3)
    expect(OrderItem.top_three_items.first.title).to eq("Adult Penguin")
  end

  it "can average quantity" do
    expect(OrderItem.average_quantity).to eq(0)
  end
end
