require 'rails_helper'
RSpec.describe "As a visitor can visit category show page" do
    it " can visit category show page" do
        create_items
        
        visit '/cats'
        
    end
end