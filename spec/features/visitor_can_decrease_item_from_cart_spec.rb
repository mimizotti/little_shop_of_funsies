require "rails_helper"

 describe "Visitor cart has an item in it" do
   describe "visitor sees that her cart has a quantity of 2" do
     describe "the visitor can remove the item" do
       it "visitor sees that she has 1 items in her cart and the subtotal of her order decreases" do
          create_items
          visit items_path

          click_on "Add to cart"
          click_on "Add to cart"

          visit "/cart"
          expect(page).to have_content(2)
          expect(page).to have_content(39.98)
          expect(page).to have_content(@item.title)
          click_on "decrease quantity"
          expect(page).to have_content(19.99)
          expect(page).to have_content(@item.title)
          expect(page).to have_content("Subtotal (1 items) is $19.99")
       end
     end
   end
 end
