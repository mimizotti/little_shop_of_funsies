require 'rails_helper'

RSpec.describe "As a visitor I can login" do
	it "as a user I can log out" do
		user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")
		visit '/'
		click_on 'Login'
		fill_in "session[email]", with: "testerson@testmail.com"
		fill_in "session[password]", with: "testing"
		click_on 'Login'
		click_on 'Logout'
		expect(page).to have_content("Login")

	end
end