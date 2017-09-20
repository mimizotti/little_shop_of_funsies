require "rails_helper"

def setup
  def create_orders

  admin_user = User.create(first_name: "Admin", last_name: "McAdmin", email: "admin@admin.com", password: "boom", role: "admin")

  allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(admin_user)


describe "As an admin when I visit the dashboard" do
  describe " I see a table" do
    it " that ranks our items by popularity" do
      it " I can see the total sales for each item" do
        it "I can see the total count sold for each item" do

          visit admin_dashboard_index
          


        end
      end
    end
  end

  describe "I see a table" do
    it "ranks our customers by total spent" do
      it "I see the customer's id" do
        it "I see the customer's name" do
          it "I see the total number of orders for that customer" do
          end
        end
      end
    end
  end
  end

end
end
