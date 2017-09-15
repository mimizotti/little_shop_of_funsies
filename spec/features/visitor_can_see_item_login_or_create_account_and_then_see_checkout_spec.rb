RSpec.describe "As a visitor" do
	describe "when I visit my cart" do
		it "I can sign up or log in" do
			admin = User.new(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail", role: "admin")
			create_items
	    visit items_path
			click_on "Add to cart"
			visit carts_path
			expect(page).to have_content("Create new account")
			expect(page).to have_content("Login")
			click_on "Create new account"
			fill_in "user[first_name]", with: "Tester"
	    fill_in "user[last_name]", with: "McTesty"
	    fill_in "user[email]", with: "testerson@testmail.com"
	    fill_in "user[password]", with: "testing"
			click_on "Submit"
			visit '/carts'
<<<<<<< HEAD
			expect(page).to have_content("Checkout")
=======
			expect(page).to have_content("Black Cat Onesie")
			expect(page).to have_content("Quantity: 1")
>>>>>>> 3fece5a663c9393a19a200d5abf0e5ff3d09880d
		end
	end
end