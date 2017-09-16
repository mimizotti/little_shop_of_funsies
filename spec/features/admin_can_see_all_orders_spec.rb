require 'rails_helper'

RSpec.feature "Admin Orders" do
  before(:each) do
    more_orders
  end
  context "As an admin" do
    it "I can see the total number of orders for each status" do
      admin = User.create(first_name: "Mimi", last_name: "Le", email: "mimi@mimi.com", password: "mimi", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_index_path

      orders = [@order, @order_2, @order_3, @order_4]

      orders.each do |order|
        expect(page).to have_content(order.id)
        expect(page).to have_content(order.date)
        expect(page).to have_content(order.status)
      end

      expect(page).to have_content("Ordered: 1")
      expect(page).to have_content("Paid: 1")
      expect(page).to have_content("Cancelled: 1")
      expect(page).to have_content("Completed: 1")
    end
  end
end
