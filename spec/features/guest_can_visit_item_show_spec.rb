require 'rails_helper'

RSpec.describe "As a visitor" do
	it "from the item index, visitor can visit an item's show page" do
		one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
		two_url = "https://www.kcmaustralia.com/media/Animal%20Onesie/adventure%20time%20jake%20onesie.jpg"
		category = Category.create(title: "Animals")
		item_one = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
		image: one_url )
		item_two = category.items.create(title: "Funsie Twosie", description: "too awesome", price: 12.00,
		image: two_url )

		visit '/items'

		click_on item_one.title

		expect(page).to have_content(item_one.title)
		expect(page).to have_content(item_one.description)
		expect(page).to have_content(item_one.price)
		expect(page).to have_css("img[src=\"#{one_url}\"]")
		expect(page).to have_content("Shop")


		visit '/items'
		click_on item_two.title

		expect(page).to have_content
		expect(page).to have_content(item_two.title)
		expect(page).to have_content(item_two.description)
		expect(page).to have_content(item_two.price)
		expect(page).to have_css("img[src=\"#{two_url}\"]")

	end
end
