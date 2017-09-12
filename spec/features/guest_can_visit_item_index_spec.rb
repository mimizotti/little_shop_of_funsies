RSpec.describe "As a visitor" do
	it "can visit the dashboard and see the link to item index" do
		visit "/"
		expect(page).to have_content("All Items")
	end
	it "from the root, visitor can visit items index and see all items" do
		one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
		two_url = "https://www.kcmaustralia.com/media/Animal%20Onesie/adventure%20time%20jake%20onesie.jpg"
		item_one = Item.new(name: "Funsie Onesie", description: "number one", price: 800,
		image: one_url
		item_two = Item.new(name: "Funsie Twosie", description: "too awesome", price: 1200,
		image: two_url )
		visit '/'
		click_on 'All Items'
		
		expect(page).to have_content(item_one.name)
		expect(page).to have_content(item_one.description)
		expect(page).to have_content(item_one.price)
		expect(page).to have_css("img[src=\"#{one_url}\"]")
		expect(page).to have_content(item_two.name)
		expect(page).to have_content(item_two.description)
		expect(page).to have_content(item_two.price)
		expect(page).to have_css("img[src=\"#{two_url}\"]")
	end
end