require "rails_helper"

 describe "Visitor cart has an item in it" do
   describe "visitor sees that her cart has a quantity of 1" do
     describe "the visitor can remove the item" do
       it "visitor sees that she has 0 items in her cart and the subtotal of her order decreases" do
         @item = create_items
          visit "/cart"
          expect(page).to have_content(1)
          expect(page).to have_content(19.99)
          expect(page).to have_content(@item.title)
          click_on "decrease quantity"
          expect(page).to_not have_content(19.99)
          expect(page).to_not have_content(@item.title)
          expect(page).to have_content("Subtotal (0 items) is $0")
       end
     end
   end
 end
