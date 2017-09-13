require 'rails_helper'

feature "Visitor can increase an item's quantity in the cart" do
  before(:each) do

    create_items

  end

  scenario "visitor has an item in the cart and then she increases it to 2" do
    visit '/cart'

    expect(page).to have_content(@item.title)
    expect(page).to have_content(1)

    click_on "Increase"

    expect(current_path).to eq('/cart')
    expect(page).to have_content(@item.title)
    expect(page).to have_content(2)

    expect(@cart.total_count).to eq(2)

    expect(@cart.subtotal).to eq(39.98)

    expect(@cart.total).to eq(39.98)
  end
end
