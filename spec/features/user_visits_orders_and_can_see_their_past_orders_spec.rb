RSpec.describe "As a user" do
	describe "visits /orders" do
		it "can see all past orders" do
			two_items
			user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
			order_1 = user.orders.create(status: "ordered")
			order_1.items.(@item_one, @item_two)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
			visit '/orders'
			expect(page).to have_content("Funsie Onesie")
			expect(page).to have_content("Funsie Twosie")
		end
	end
end