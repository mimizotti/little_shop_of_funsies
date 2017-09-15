require 'rails_helper'

RSpec.describe 'As a visitor' do
	describe 'when visiting an items show page' do
		it 'a user cannot see add to cart for a retired item' do
			category = Category.create(title: "Animals")
			one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
			item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
			image: one_url, condition: 'retired' )
			
			visit items_path
			save_and_open_page
			
			expect(page).not_to have_content("Add to cart")
		end
	end
end