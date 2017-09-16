require 'rails_helper'

RSpec.feature "Authenticated users security" do
  context "As a user" do
    before(:each) do
      twelve_items
      @user_1 = User.create(first_name: "Mimi", last_name: "Le", email: "mimi@mimi.com", password: "mimi")
      @user_2 = User.create(first_name: "Jake", last_name: "the Dog", email: "jake@adventuretime.com", password: "dog")

      @order = Order.create(status: "ordered", user_id: @user_1.id)

      items_hash = {
                      @unicorn_onesie_1 => 1,
                      @squirrel_onesie_1 => 2
                   }

      @order.add(items_hash)

      visit root_path

      click_on "Login"

      fill_in "session[email]", with: "jake@adventuretime.com"
      fill_in "session[password]", with: "dog"

      within(".action") do
        click_on("Login")
      end
    end
    it "I cannot view another user’s private data" do

      expect(current_path).to eq(dashboard_index_path)

      visit order_path(@order)

      expect(current_path).to eq(dashboard_index_path)
      expect(page).to have_content(@user_2.email)
    end
    it "I cannot view the administrator screens" do
      visit admin_dashboard_index_path

      expect(page).to have_content("404")
    end
  end
end
