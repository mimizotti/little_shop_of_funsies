require "rails_helper"

describe "validations" do
  context "invalid attributes" do

    it "is invalid without a first name" do
      user = User.new(last_name: "McTest", password: "testing", email: "tester@testmail")
      expect(user).to be_invalid
    end

    it "is invalid without a last name" do
      user1 = User.new(first_name: "McTest", password: "testing", email: "tester@testmail")
      expect(user1).to be_invalid
    end

    it "is invalid without a password" do
      user2 = User.new(first_name: "Testy", last_name: "McTest", email: "tester@testmail")
      expect(user2).to be_invalid
    end

    it "is invalid without an e-mail" do
      user3 = User.new(first_name: "McTest",last_name: "McTest", password: "testing")
      expect(user3).to be_invalid
    end

    it "is invalid without a unique e-mail" do
      user4 = User.create(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail")
      user5 = User.new(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail")
      expect(user5).to be_invalid
    end
  end

  context "it can have one of two roles" do
    it "has a role" do
      user = User.new(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail")
      expect(user.role).to eq("default")
    end

    it "can be an admin" do
      admin = User.new(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail", role: "admin")
      expect(admin.role).to eq("admin")
    end
  end

  context "instance methods" do
    it "can return user's full name" do
      user = User.new(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail")
      expect(user.full_name).to eq("McTest McTest")
    end

    it "can return the date a user joined" do
      user = User.create(first_name: "McTest",last_name: "McTest", password: "testing", email: "tester@testmail", created_at: "2017-09-13 01:13:04 -0600")
      expect(user.date_joined).to eq("Sep. 13, 2017")
    end
  end
end
