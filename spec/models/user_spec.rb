require "rails_helper"

describe "validations" do
  context "invalid attributes" do
    it "is invalid without a first name" do
      User.create(last_name: "McTest", password: "testing", email: "tester@testmail")
      
    end
  end
end
