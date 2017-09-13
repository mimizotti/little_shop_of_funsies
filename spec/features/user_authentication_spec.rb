require "rails_helper"

describe "As a registered user When I visit “/” Then I should see a link for “Login”" do
describe "And when I click “Login” I should be on the “/login page”" do
  describe " And I should see a place to insert my credentials to login" do
    describe "And I fill in my desired credentials and submit" do
      describe "Then my current page should be “/dashboard”" do
        it " And I should see a message in the navbar that says “Logged in as SOME_USER” as well as my profile information and I  a link for “Logout, but no link for log_in”" do

          user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")

          visit '/'

          expect(page).to have_link("Login")

          click_on "Login"
          expect(current_path).to eq(login_path)

          fill_in "session[email]", with: "testerson@testmail.com"
          fill_in "session[password]", with: "testing"

          click_on "Login"

          expect(current_path).to eq(dashboard_index_path)
          expect(page).to have_content "Logged in as Tester McTesty"
          expect(page).to have_content "testerson@testmail.com"

          expect(page).to_not have_link "Login"
          expect(page).to have_link "Logout"

          end
        end
      end
    end
  end
  describe "As a registered user When I visit “/” Then I should see a link for “Login”" do
  describe "And when I click “Login” I should be on the “/login page”" do
    describe "And I should see a place to insert my credentials to login" do
      describe "And I fill in my email but no password " do
        it "I should see a message that says ""that log in was unsuccessful""" do

            user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")

            visit '/'

            expect(page).to have_link("Login")

            click_on "Login"
            expect(current_path).to eq(login_path)

            fill_in "session[email]", with: "testerson@testmail.com"


            click_on "Login"

            expect(current_path).to eq(login_path)
            expect(page).to have_content "That login was unsuccessful"
          end
        end
      end
    end

    describe "As a registered user When I visit “/” Then I should see a link for “Login”" do
    describe "And when I click “Login” I should be on the “/login page”" do
      describe "And I should see a place to insert my credentials to login" do
        describe "And I fill in the wrong email  " do
          it "I should see a message that says ""that log in was unsuccessful""" do

              user = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")

              visit '/'

              expect(page).to have_link("Login")

              click_on "Login"
              expect(current_path).to eq(login_path)

              fill_in "session[email]", with: "tester@testmail.com"
              fill_in "session[password]", with: "testing"


              click_on "Login"

              expect(current_path).to eq(login_path)
              expect(page).to have_content "That login was unsuccessful"

            end
          end
        end
      end
    end
  end
end
