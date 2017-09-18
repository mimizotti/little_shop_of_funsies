RSpec.describe "As a user" do
	describe "visits /orders" do
		it "can see all past orders" do
			two_items
			user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing", address: "dummy address")
			order_1 = user.orders.create(status: "ordered")
			OrderItem.create(order: order_1, item: @item_one)
			OrderItem.create(order: order_1, item: @item_two)
			allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
			visit '/orders'
			expect(page).to have_content(order_1.id)
			expect(page).to have_content(order_1.status.capitalize)
			expect(page).to have_content(20.0)
		end
	end
end
