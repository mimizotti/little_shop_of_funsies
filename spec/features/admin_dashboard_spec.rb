require 'rails_helper'

  describe "admin dashboard feature" do
    describe "As a logged in Admin user" do
      describe "when I visit /admin/dashboard" do
        it "I will see a heading on the page that says Admin Dashboard" do

          admin_user = User.create(first_name: "Admin", last_name: "McAdmin", email: "admin@admin.com", password: "boom", role: "admin")

          allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(admin_user)

          visit admin_dashboards_path
          expect(page).to have_content("Admin Dashboard")

      end
    end
  end

  describe "as a logged in user when I visit /admin/dashboard" do
    it "I see a 404 error" do

      default_user = User.create(first_name: "Admin", last_name: "McAdmin", email: "admin@admin.com", password: "boom")

      allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(default_user)

      visit admin_dashboards_path

      expect(page).to have_content("404")

    end
  end


  describe "as a visitor when I visit /admin/dashboard" do
    it "I see a 404 error" do

      visit admin_dashboards_path

      expect(page).to have_content("404")

    end
  end
end

feature "as an Admin" do
  describe "when I log into my account" do
    it "I am redirected to the Admin Dashboard" do
      admin = User.create(first_name: "Admin", last_name:"McAdmin", email: "admin@email", password: "boom", role: "admin")

      visit login_path
      fill_in "[session]email", with: admin.email
      fill_in "[session]password", with: admin.password
      click_on "Login"

      expect(page).to have_content("Admin Dashboard")
      expect(current_path).to eq(admin_dashboard_path)
    end
  end
end
