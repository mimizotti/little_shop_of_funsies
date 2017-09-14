require 'rails_helper'

RSpec.describe Order do
	describe 'validations' do
		describe 'invalid attributes' do
      it 'is invalid without a status' do
        user = User.create!(first_name: "Testy", last_name: "McTest", password: "testing", email: "tester@testmail")
        user.orders.create
        expect(user.orders.first).to be_invalid
      end
    end
    describe 'valid attributes' do
      it 'is valid with a status' do
        user = User.create!(first_name: "Testy", last_name: "McTest", password: "testing", email: "tester@testmail")
        user.orders.create(status: "ordered")
        expect(user.orders.first).to be_valid
      end
    end
  end
  describe 'realtionships' do
    it 'belongs to a user' do
      user = User.create!(first_name: "Testy", last_name: "McTest", password: "testing", email: "tester@testmail")
      order = user.orders.create(status: "ordered")
      expect(order).to respond_to(:user)
    end
    it 'has many items' do
      user = User.create!(first_name: "Testy", last_name: "McTest", password: "testing", email: "tester@testmail")
      order = user.orders.create(status: "ordered")
      expect(order).to respond_to(:items)
    end
    it 'belongs to a items' do
      user = User.create!(first_name: "Testy", last_name: "McTest", password: "testing", email: "tester@testmail")
      order = user.orders.create(status: "ordered")
      category = Category.create(title: "Animals")
      one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
			item = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
			image: one_url )
      expect(item).to respond_to(:orders)
    end
  end
end
