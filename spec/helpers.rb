module Helpers
  def add_item_to_cart
    @category = Category.create(title: "Cats")
    @item = Item.create(title: "Black Cat Onesie",
                        description: "The best cat onesie you'll ever find",
                        price: 19.99,
                        image: "https://images-na.ssl-images-amazon.com/images/I/41CFHIae7TL._SL500_.jpg",
                        category_id: category)
  end
end
