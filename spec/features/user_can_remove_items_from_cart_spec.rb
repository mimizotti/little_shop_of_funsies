# Background: My cart has an item in it
#
# As a visitor
# When I visit “/cart”
# And I click link “Remove”
# Then my current page should be “/cart”
# And I should see a message styled in green
# And the message should say “Successfully removed SOME_ITEM from your cart.”
# And the title “SOME_ITEM” should be a link to that item in case the user wants to add it back
# And I should not see the item listed in cart

require 'rails_helper'

RSpec.feature "Removing items from cart" do
  before(:each) do

    create_items

  end
  context "As a visitor" do
    it "I should be able to remove items from my cart" do
      visit items_path

      expect(page).to have_link("Add to cart")

      within ".item-1" do
        click_link("Add to cart", :match => :first)
      end

      click_on "Cart"

      within ".item-1" do
        click_link("Remove", :match => :first)
      end

      expect(page).to have_content("Successfully removed #{@item.title} from your cart.”")
      expect(page).to have_link(@item.title, item_path(@item))
      expect(page).to_not have_content(@item.title)
    end
  end
end
