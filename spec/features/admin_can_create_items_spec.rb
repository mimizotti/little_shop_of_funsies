require 'rails_helper'

RSpec.feature "Admin item creation" do
  context "As an authenticated admin" do
    it "I can create an item" do
      admin = User.create(first_name: "Mimi", last_name: "Le", email: "mimi@mimi.com", password: "mimi", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_items_path
      two_items
      
      click_on "Create New Item"
      fill_in "item[title]", with: "Onesie"
      fill_in "item[description]", with: "This Onesie is awesome!"
      fill_in "item[price]", with: "59.99"
      click_on "Create Item"
      
      expect(current_path).to eq(admin_items_path)
      expect(page).to have_content("Onesie")
      expect(page).to have_content("This Onesie is awesome!")
      expect(page).to have_content("59.99")
      
      
    end
  end
end
