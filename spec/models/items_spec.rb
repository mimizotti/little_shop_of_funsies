require 'rails_helper'


describe Item do
	describe 'validations' do
		describe 'invalid attributes' do
			it 'is invalid without a title' do
				category = Category.create(title: "Animals")
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item = category.items.create(description: "number one", price: 8.00, image: one_url )
				expect(item).to be_invalid
			end
			
			it 'is invalid without a description' do
				category = Category.create(title: "Animals")
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item = category.items.create(title: "Funsie Onesie", price: 8.00, image: one_url )
				expect(item).to be_invalid
			end
			
			it 'is invalid without a price' do
				category = Category.create(title: "Animals")
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item = category.items.create(title: "Funsie Onesie",  description: "number one", image: one_url )
				expect(item).to be_invalid
			end
			it 'is invalid without a image' do
				category = Category.create(title: "Animals")
				item = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,)
				expect(item).to be_invalid
			end
			
			it 'is invalid without a unique title' do
				category = Category.create(title: "Animals")
				two_url = "https://www.kcmaustralia.com/media/Animal%20Onesie/adventure%20time%20jake%20onesie.jpg"
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
				image: one_url )
				item_two = category.items.create(title: "Funsie Onesie", description: "other", price: 9.00,
				image: two_url )
				expect(item_two).to be_invalid
			end
			
			it 'is invalid without a  unique image' do
				category = Category.create(title: "Animals")
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				two_url = "https://www.kcmaustralia.com/media/Animal%20Onesie/adventure%20time%20jake%20onesie.jpg"
				item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
				image: one_url )
				item_two = category.items.create(title: "Funsie Twosie", description: "other", price: 9.00,
				image: one_url )
				expect(item_two).to be_invalid
			end
		end
		describe 'valid attributes' do
			it 'can be created with valid attributes' do
				category = Category.create(title: "Animals")
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
				image: one_url )
				expect(item_one).to be_valid
			end
		end
	end
	describe "relationships" do
    it "belongs to a category" do
      category = Category.create(title: "Animals")
			one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
			item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
			image: one_url )
      expect(item).to respond_to(:category)
    end
  end
end