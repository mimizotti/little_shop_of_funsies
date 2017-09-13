require 'rails_helper'

RSpec.feature "Adding items to the cart" do
  before(:each) do

    create_items

  end
  context "As a visitor" do
    it "I should be able to add items to cart" do
      visit items_path

      expect(page).to have_link("Add to cart")

      click_on "Add to cart"

      expect(page).to have_content("1 Black Cat Onesie has been added to your cart")

      click_on "Cart"

      expect(current_path).to eq(cart_path)
      expect(page).to have_css("img[src=\"#{@item.image}\"]")
      expect(page).to have_content(@item.name)
      expect(page).to have_content(@item.description)

      within '.total' do
        page.should have_content "$19.99"
      end
    end
  end
end
