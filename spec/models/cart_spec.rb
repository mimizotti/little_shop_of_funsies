require 'rails_helper'

RSpec.describe Cart do
  subject { Cart.new({"1" => 2, "2" => 3}) }

  describe "#total_count" do
    it "calculates the total number of items it holds" do
      expect(subject.total_count).to eq(5)
    end
  end

  describe "#add_item" do
    it "adds an item to its contents" do
      subject.add_item(1)
      subject.add_item(2)
      subject.add_item(3)

      expect(subject.contents).to eq({"1" => 3, "2" => 4, "3" => 1})
    end
  end

  describe "#decrease quantity" do
    it "decreases the amount of an item in a cart" do
      subject.decrease_quantity(1)

      expect(subject.contents).to eq("1"=>1, "2"=>3)
    end

    it "can remove an item it it drops to quantity 0" do
      subject.decrease_quantity(1)
      subject.decrease_quantity(1)

      expect(subject.contents).to eq("2"=>3)
    end
  end

  describe "#increase quantity" do
    it "can increase the amount of an item in a cart" do
      subject.increase_quantity(1)

      expect(subject.contents).to eq("1" => 3, "2" => 3)
    end
  end

  describe "#count_of" do
    it "reports how many of a particular item" do
      expect(subject.count_of(1)).to eq(2)
      expect(subject.count_of(2)).to eq(3)
    end
  end

  describe "#item_and_quantity"do
    it "returns a hash of item objects and quantity" do
      category = Category.create(title: "Animals")
      one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
      item_1 = category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00)
      item_2 = category.items.create(title: "Funsie Twosie", description: "number two", price: 10.00)

      expect(subject.item_and_quantity[item_1]).to eq(2)
      expect(subject.item_and_quantity[item_2]).to eq(3)
    end
  end

  describe "#delete_item" do
    it "can remove one item from the cart" do
      subject.delete_item(1)

      expect(subject.contents).to eq("2" => 3)
    end
  end

  describe "#destroy" do
    it "can remove all items from the cart" do
      subject.destroy

      expect(subject.contents).to eq({})
    end
  end
end
