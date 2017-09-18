module Helpers
  def create_items
    @category = Category.create(title: "Cats")
    @item = @category.items.create(title: "Black Cat Onesie",
                        description: "The best cat onesie you'll ever find",
                        price: 19.99,
                        image: "https://images-na.ssl-images-amazon.com/images/I/41CFHIae7TL._SL500_.jpg")
  end

  def two_items
    @one_url = "http://pandathings.com/wp-content/uploads/2016/10/onesie-6-300x300.png"
		@two_url = "https://www.kcmaustralia.com/media/Animal%20Onesie/adventure%20time%20jake%20onesie.jpg"
		@category = Category.create(title: "Animals")
		@item_one = @category.items.create(title: "Funsie Onesie", description: "number one", price: 8.00,
		image: @one_url )
		@item_two = @category.items.create(title: "Funsie Twosie", description: "too awesome", price: 12.00,
		image: @two_url )
  end


  def create_orders

    user1 = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing")

    order_1 = user1.orders.create(status: "ordered")
    order_1 << @item_one
    order_1 << @item_two

    user2 = User.create(first_name: "SoTesty", last_name: "DeTest", email:"test@testmail.com", password: "testing")

    order_2 = user2.orders.create(status: "compeleted")
    order_2 << @item_one

    order_3 = user2.orders.create(status: "compeleted")
    order_3 << @item_one
    order_3 << @item_two

    user3 = User.create(first_name: "BestTest", last_name: "ReTest", email:"testing@testmail.com", password: "testing")

    order_4 = user3.orders.create(status: "compeleted")
    order_4 << @item_one
  end

end
