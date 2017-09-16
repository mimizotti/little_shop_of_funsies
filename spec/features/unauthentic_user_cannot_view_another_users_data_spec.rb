require 'rails_helper'

RSpec.feature "Unauthenticated users security" do
  before(:each) do
    setup
  end
  context "As an unauthenticated user" do
    it "I cannot view another user’s private data" do
      visit dashboard_index_path

      expect(current_path).to eq(login_path)

      visit order_path(@order)

      expect(current_path).to eq(login_path)
    end
  end
end
