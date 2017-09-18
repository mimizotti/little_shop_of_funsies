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

  def twelve_items

    description = "Lorem ipsum dolor sit amet, officiis quaerendum eu nam, voluptua deterruisset vix at. In dico sonet aliquip has, eos prima appellantur ea. Omnesque facilisi cu pro. Ut vix brute etiam repudiare. Esse animal explicari ad eam, vis ex oratio ornatus voluptatibus, movet sadipscing ea qui."

    @unicorn = Category.create(title: "Unicorns")
    @squirrel = Category.create(title: "Squirrels")
    @giraffe = Category.create(title: "Giraffes")
    @cat = Category.create(title: "Cats")
    @penguin = Category.create(title: "Penguins")
    @pokemon = Category.create(title: "Pokemon")
    @zebra = Category.create(title: "Zebras")
    @sloth = Category.create(title: "Sloths")

    @unicorn_onesie_1 = @unicorn.items.create(title: "Baby Unicorn",
                          description: description,
                          price: 39.99,
                          image: "baby-unicorn-onesie.png")

    @unicorn_onesie_2 = @unicorn.items.create(title: "Adult Unicorn",
                          description: description,
                          price: 59.99,
                          image: "unicorn-onesie.png")

    @squirrel_onesie_1 = @squirrel.items.create(title: "Adult Squirrel - Pink/White",
                          description: description,
                          price: 59.99,
                          image: "flying-squirrel-onesie-1.png")

    @squirrel_onesie_2 = @squirrel.items.create(title: "Adult Squirrel - Orange/Black",
                          description: description,
                          price: 59.99,
                          image: "flying-squirrel-onesie-2.png")

    @giraffe_onesie_1 = @giraffe.items.create(title: "Adult Giraffe",
                          description: description,
                          price: 59.99,
                          image: "giraffe-onesie.png")

    @cat_onesie_1 = @cat.items.create(title: "Adult Leopard",
                          description: description,
                          price: 49.99,
                          image: "leopard-onesie.png")

    @cat_onesie_2 = @cat.items.create(title: "Adult Tiger",
                          description: description,
                          price: 49.99,
                          image: "tiger-onesie.png")

    @penguin_onesie_1 = @penguin.items.create(title: "Adult Penguin",
                          description: description,
                          price: 49.99,
                          image: "penguin-onesie.png")

    @pokemon_onesie_1 = @pokemon.items.create(title: "Young Pikachu - Boy",
                          description: description,
                          price: 29.99,
                          image: "pikachu-onesie-boy.png")

    @pokemon_onesie_2 = @pokemon.items.create(title: "Young Pikachu - Girl",
                          description: description,
                          price: 29.99,
                          image: "pikachu-onesie-girl.png")

    @zebra_onesie_1 = @zebra.items.create(title: "Adult Zebra",
                          description: description,
                          price: 29.99,
                          image: "zebra-onesie.png")

    @sloth_onesie_1 = @sloth.items.create(title: "Adult Sloth",
                          description: description,
                          price: 69.99,
                          image: "sloth-onesie.png")

  end

  def setup
    twelve_items
    @user_1 = User.create(first_name: "Mimi", last_name: "Le", email: "mimi@mimi.com", password: "mimi")
    @user_2 = User.create(first_name: "Jake", last_name: "the Dog", email: "jake@adventuretime.com", password: "dog")

    @order = @user_1.orders.create(status: "ordered")

    items_hash = {
                    @unicorn_onesie_1 => 1,
                    @squirrel_onesie_1 => 2
                 }

    @order.add(items_hash)
  end
  def more_orders
    setup

    @order_2 = Order.create(status: "paid", user_id: @user_1.id)

    items_hash = {
                    @zebra_onesie_1 => 1,
                    @sloth_onesie_1 => 1
                  }

    @order_2.add(items_hash)

    @order_3 = Order.create(status: "cancelled", user_id: @user_2.id)

    items_hash = {
                    @penguin_onesie_1 => 3,
                    @pokemon_onesie_1 => 1
                  }

    @order_3.add(items_hash)

    @order_4 = Order.create(status: "completed", user_id: @user_2.id)

    items_hash = {
                    @cat_onesie_2 => 4,
                    @giraffe_onesie_1 => 3
                  }

    @order_4.add(items_hash)
  end
end
