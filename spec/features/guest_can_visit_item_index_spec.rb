require 'rails_helper'

RSpec.describe "As a visitor" do
	it "from the root, visitor can visit items index and see all items" do
		two_items
		visit '/items'
		# click_on 'All Items'

		expect(page).to have_content(item_one.title)
		expect(page).to have_content(item_one.price)
		expect(page).to have_css("img[src=\"#{one_url}\"]")
		expect(page).to have_content(item_two.title)
		expect(page).to have_content(item_two.price)
		expect(page).to have_css("img[src=\"#{two_url}\"]")

	end
end
