require 'rails_helper'

feature "Admin can view individual order pages" do
  before(:each) do

    two_items

  end

  scenario "As an admin, when I visit an individual order page" do
    user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
    order_1 = user.orders.create(status: "ordered")
    OrderItem.create(order: order_1, item: @item_one, quantity: 1)
    OrderItem.create(order: order_1, item: @item_two, quantity: 2)

    full_name = user.first_name + " " + user.last_name

    admin_user = User.create(first_name: "Admin", last_name: "McAdmin", email: "admin@admin.com", password: "boom", role: "admin")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)

    visit order_path(order_1)

    expect(page).to have_content(order_1.date)
    expect(page).to have_content(full_name)
    expect(page).to have_content(order_1.address)

    expect(page).to have_content(@item_one.title)
    expect(page).to have_content(@item_one.order_items.quantity)
    expect(page).to have_content(@item_one.price)
    expect(page).to have_content("Subtotal: #{@item_one.price}")

    expect(page).to have_content(@item_two.title)
    expect(page).to have_content(@item_two.order_items.quantity)
    expect(page).to have_content(@item_two.price)
    expect(page).to have_content("Subtotal: #{@item_two.price * 2}")

    expect(page).to have_content(order_1.total_price)
  end
end

# And I can see, for each item on the order:
#
# The item’s name, which is linked to the item page.
# Quantity in this order.
# Price
# Line item subtotal. And I can see the total for the order. And I can see the status for the order.
