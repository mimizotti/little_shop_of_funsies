require "rails_helper"

describe "As a registered user When I visit “/” Then I should see a link for “Login”" do
describe "And when I click “Login” I should be on the “/login page”" do
  describe " And I should see a place to insert my credentials to login" do
    describe "And I fill in my desired credentials and submit" do
      describe "Then my current page should be “/dashboard”" do
        it " And I should see a message in the navbar that says “Logged in as SOME_USER” as well as my profile information and I  a link for “Logout, but no link for log_in”" do

          end
        end
      end
    end 
  end
end
