require 'rails_helper'
describe Category do
	describe 'validations' do
		describe 'invalid attributes' do
			it "can't be created without a title" do
				category = Category.new
				expect(category).to be_invalid
			end
		end
		describe 'valid attributes' do
			it 'can be created with a title' do
				category = Category.new(title: "Animals")
				expect(category).to be_valid
			end
		end
	end
	describe "relationships" do
    it "has many items" do
			category = Category.new(title: "Animals")
			expect(category).to respond_to(:items)
    end
  end
end