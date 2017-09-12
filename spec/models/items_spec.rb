require 'rails_helper'


describe Item do
	describe 'validations' do
		describe 'invalid attributes' do
			it 'is invalid without a title' do
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item = Item.create(description: "number one", price: 8.00, image: one_url )
				expect(item).to be_invalid
			end
			it 'is invalid without a description' do
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item = Item.create(title: "Funsie Onesie", price: 8.00, image: one_url )
				expect(item).to be_invalid
			end
			it 'is invalid without a price' do
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item = Item.create(title: "Funsie Onesie",  description: "number one", image: one_url )
				expect(item).to be_invalid
			end
			it 'is invalid without a image' do
				item = Item.create(title: "Funsie Onesie", description: "number one", price: 8.00,)
				expect(item).to be_invalid
			end
			it 'is invalid without a unique title' do
				two_url = "https://www.kcmaustralia.com/media/Animal%20Onesie/adventure%20time%20jake%20onesie.jpg"
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item_one = Item.create(title: "Funsie Onesie", description: "number one", price: 8.00,
				image: one_url )
				item_two = Item.create(title: "Funsie Onesie", description: "other", price: 9.00,
				image: two_url )
				expect(item_two).to be_invalid
			end
			it 'is invalid without a  unique image' do
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				two_url = "https://www.kcmaustralia.com/media/Animal%20Onesie/adventure%20time%20jake%20onesie.jpg"
				item_one = Item.create(title: "Funsie Onesie", description: "number one", price: 8.00,
				image: one_url )
				item_two = Item.create(title: "Funsie Twosie", description: "other", price: 9.00,
				image: one_url )
				expect(item_two).to be_invalid
			end
		end
	end
end