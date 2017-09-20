require "rails_helper"


describe "As an admin when I visit the dashboard" do
  before(:each) do
    twelve_items
    create_orders
    admin_user = User.create(first_name: "Admin", last_name: "McAdmin", email: "admin@admin.com", password: "boom", role: "admin")

    allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(admin_user)
  end
  describe " I see a table" do
    it " that ranks our items by popularity" do
            visit admin_analytics_path
            save_and_open_page

  #
  #     it " I can see the total sales for each item" do
  #       it "I can see the total count sold for each item" do
  #
  #
  #
  #
  #
  #       end
  #     end
  #   end
  # end
  #
  # describe "I see a table" do
  #   it "ranks our customers by total spent" do
  #     it "I see the customer's id" do
  #       it "I see the customer's name" do
  #         it "I see the total number of orders for that customer" do
  #         end
  #       end
  #     end
    end
  end
end
