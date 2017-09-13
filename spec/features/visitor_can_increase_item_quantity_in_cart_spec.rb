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

# When I visit “/cart”
# Then I should see my item with a quantity of 1
# And when I increase the quantity
# Then my current page should be ‘/cart’
# And that item’s quantity should reflect the increase
# And the subtotal for that item should increase
# And the total for the cart should match that increase
