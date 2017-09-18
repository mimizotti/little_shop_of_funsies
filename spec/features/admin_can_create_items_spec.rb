require 'rails_helper'

RSpec.feature "Admin item creation" do
  context "As an authenticated admin" do
    it "I can create an item" do
      admin = User.create(first_name: "Mimi", last_name: "Le", email: "mimi@mimi.com", password: "mimi", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    end
  end
end
