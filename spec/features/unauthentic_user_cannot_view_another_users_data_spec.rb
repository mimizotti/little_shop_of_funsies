require 'rails_helper'

RSpec.feature "Unauthenticated users security" do
  before(:each) do
    setup
  end
  context "As an unauthenticated user" do
    it "I cannot view another user’s private data" do
      visit dashboard_index_path

      expect(current_path).to eq(login_path)

      visit order_path(@order)

      expect(current_path).to eq(login_path)
    end
    it "I should be redirected to login/create account when I try to check out" do
      visit item_path(@unicorn_onesie_1)

      click_on "Add to cart"

      click_on "Cart"

      expect(page).to_not have_content("Checkout")

      visit new_order_path

      expect(current_path).to eq(login_path)
    end
    it "I cannot view the administrator screens or use administrator functionality" do
      visit admin_dashboard_index_path

      expect(page).to have_content("404")
    end
  end
end
