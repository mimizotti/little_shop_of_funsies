require 'rails_helper'

feature "New user can create an account" do
  scenario "should see a link for create account on root page" do
    visit '/'

    expect(page).to have_link("Login")

    click_on "Login"

    expect(current_path).to eq(login_path)
    expect(page).to have_link("Create an account")

    click_on "Create an account"

    fill_in "user[first_name]", with: "Tester"
    fill_in "user[last_name]", with: "McTest"
    fill_in "user[email]", with: "test@testmail.com"
    fill_in "user[password]", with: "testing"
    fill_in "user[address]", with: "dummy address"

    click_on "Submit"

    expect(current_path).to eq(dashboard_index_path)
    expect(page).to have_content "Logged in as Tester McTest"
    expect(page).to have_content "test@testmail.com"

    expect(page).to_not have_link "Login"
    expect(page).to have_link "Logout"
  end
end
