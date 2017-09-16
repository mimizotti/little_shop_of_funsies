require "rails_helper"

describe "As a logged in Admin" do
  it "I can modify my account data" do

    admin_user = User.create(first_name: "Admin", last_name: "McAdmin", email: "admin@admin.com", password: "boom", role: "admin")

    allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(admin_user)

    visit admin_dashboards_path

    click_on "Update your account"

    fill_in "user[password]", with: "testing"
    fill_in "user[email]", with: "testerson@testmail.com"

    click_on "Submit"

    expect(page).to have_content("testerson@testmail.com")

  end

  it "But I cannot modify any other user’s account data" do
    user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")

    admin_user = User.create(first_name: "Admin", last_name: "McAdmin", email: "admin@admin.com", password: "boom", role: "admin")

    allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(admin_user)

    visit dashboard_index_path(user)
  

    click_on "Update your account"

    expect(page).to have_content("404")
  end
end
