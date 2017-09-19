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
			it 'is valid without a image' do
				category = Category.create(title: "Animals")
				item = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,)
				expect(item).to be_valid
			end
			
			it 'is invalid without a unique title' do
				category = Category.create(title: "Animals")
				two_url = "https://cdn.shopify.com/s/files/1/0768/3211/products/eeyore-kigurumi-onesie-sazac-23866341901_2048x2048_61d2ab59-04ea-4a67-a997-b6443780a1c9_2048x2048.jpg?v=1500604859"
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
				image: one_url )
				item_two = category.items.create(title: "Funsie Onesie", description: "other", price: 9.00,
				image: two_url )
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
			it 'condition is active if not specified' do
				category = Category.create(title: "Animals")
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
				image: one_url )
				expect(item_one.condition).to eq('active')
			end
			it 'condition can be set to retired' do
				category = Category.create(title: "Animals")
				one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
				item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
				image: one_url, condition: 'retired' )
				expect(item_one.condition).to eq('retired')
			end
		end
	end
	describe "relationships" do
    it "belongs to a category" do
      category = Category.create(title: "Animals")
			one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
			item = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
			image: one_url )
      expect(item).to respond_to(:category)
    end
  end
end