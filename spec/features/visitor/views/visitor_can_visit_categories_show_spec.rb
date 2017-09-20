require 'rails_helper'
RSpec.describe "As a visitor can visit category show page" do
	it " can visit category show page" do
		one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
		two_url = "https://cdn.shopify.com/s/files/1/0768/3211/products/eeyore-kigurumi-onesie-sazac-23866341901_2048x2048_61d2ab59-04ea-4a67-a997-b6443780a1c9_2048x2048.jpg?v=1500604859"
		category = Category.create(title: "Animals")
		item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
		image: one_url )
		item_two = category.items.create(title: "Funsie Twosie", description: "too awesome", price: 12.00,
		image: two_url )
		
		visit '/animals'
		
	end
end