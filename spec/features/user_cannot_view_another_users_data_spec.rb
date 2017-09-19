require 'rails_helper'

RSpec.feature "Authenticated users security" do
  context "As a user" do
    before(:each) do
      setup

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
      expect(page).to have_content(@user_2.first_name)
    end
    it "I cannot view the administrator screens" do
      visit admin_dashboard_index_path

      expect(page).to have_content("404")
    end
  end
end
