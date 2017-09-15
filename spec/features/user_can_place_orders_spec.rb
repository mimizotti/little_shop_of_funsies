require 'rails_helper'

RSpec.feature "User can place an order" do
  it "and see the message 'order was successfully placed'" do

    User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")

    create_items

    visit items_path

    click_on "Add to cart"

    visit cart_path

    within(".checkout") do
      click_on("Login")
    end

    fill_in "session[email]", with: "testerson@testmail.com"
    fill_in "session[password]", with: "testing"

    within(".action") do
      click_on("Login")
    end

    click_on "Cart"

    click_on "Checkout"

    expect(current_path).to eq('/orders')
    save_and_open_page
    expect(page).to have_content("Order was successfully placed")
    expect(page).to have_content(@item.title)
  end
end
