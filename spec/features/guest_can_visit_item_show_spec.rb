require 'rails_helper'

RSpec.describe "As a visitor" do
	it "from the item index, visitor can visit an item's show page" do
		two_items

		visit '/items'

		click_on @item_one.title

		expect(page).to have_content(@item_one.title)
		expect(page).to have_content(@item_one.description)
		expect(page).to have_content(@item_one.price)
		expect(page).to have_css("img[src=\"#{@one_url}\"]")
		expect(page).to have_content("Shop")


		visit '/items'
		click_on @item_two.title

		expect(page).to have_content
		expect(page).to have_content(@item_two.title)
		expect(page).to have_content(@item_two.description)
		expect(page).to have_content(@item_two.price)
		expect(page).to have_css("img[src=\"#{@two_url}\"]")

	end
end
