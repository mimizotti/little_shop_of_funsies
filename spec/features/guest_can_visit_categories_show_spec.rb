require 'rails_helper'
RSpec.xdescribe "As a visitor can visit category show page" do
	it " can visit category show page" do
		one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
		two_url = "https://www.kcmaustralia.com/media/Animal%20Onesie/adventure%20time%20jake%20onesie.jpg"
		category = Category.create(title: "Animals")
		item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
		image: one_url )
		item_two = category.items.create(title: "Funsie Twosie", description: "too awesome", price: 12.00,
		image: two_url )
		
		visit '/Animals'
		
	end
end