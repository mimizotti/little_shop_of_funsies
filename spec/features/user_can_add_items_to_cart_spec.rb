require 'rails_helper'

RSpec.feature "Adding items to the cart" do
  before(:each) do

    @category = Category.create(title: "Cats")
    @item = Item.create(title: "Black Cat Onesie",
                        description: "The best cat onesie you'll ever find",
                        price: 19.99,
                        image: "https://images-na.ssl-images-amazon.com/images/I/41CFHIae7TL._SL500_.jpg",
                        category_id: category)
  end
  context "As a visitor" do
    it "I should be able to add items to cart" do
      visit items_path

      expect(page).to have_link("Add to cart")

      within ".item-1" do
        click_link("Add to cart", :match => :first)
      end

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
