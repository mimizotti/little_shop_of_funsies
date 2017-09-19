Category.destroy_all
Item.destroy_all

description = "Lorem ipsum dolor sit amet, officiis quaerendum eu nam, voluptua deterruisset vix at. In dico sonet aliquip has, eos prima appellantur ea. Omnesque facilisi cu pro. Ut vix brute etiam repudiare. Esse animal explicari ad eam, vis ex oratio ornatus voluptatibus, movet sadipscing ea qui."

unicorn = Category.create(title: "Unicorns")
squirrel = Category.create(title: "Squirrels")
giraffe = Category.create(title: "Giraffes")
cat = Category.create(title: "Cats")
penguin = Category.create(title: "Penguins")
pokemon = Category.create(title: "Pokemon")
zebra = Category.create(title: "Zebras")
sloth = Category.create(title: "Sloths")

unicorn.items.create(title: "Baby Unicorn",
                      description: description,
                      price: 39.99,
                      image: "baby-unicorn-onesie.png")

unicorn.items.create(title: "Adult Unicorn",
                      description: description,
                      price: 59.99,
                      image: "unicorn-onesie.png")

squirrel.items.create(title: "Adult Squirrel - Pink/White",
                      description: description,
                      price: 59.99,
                      image: "flying-squirrel-onesie-1.png")

squirrel.items.create(title: "Adult Squirrel - Orange/Black",
                      description: description,
                      price: 59.99,
                      image: "flying-squirrel-onesie-2.png")

giraffe.items.create(title: "Adult Giraffe",
                      description: description,
                      price: 59.99,
                      image: "giraffe-onesie.png")

cat.items.create(title: "Adult Leopard",
                      description: description,
                      price: 49.99,
                      image: "leopard-onesie.png")

cat.items.create(title: "Adult Tiger",
                      description: description,
                      price: 49.99,
                      image: "tiger-onesie.png")

penguin.items.create(title: "Adult Penguin",
                      description: description,
                      price: 49.99,
                      image: "penguin-onesie.png")

pokemon.items.create(title: "Young Pikachu - Boy",
                      description: description,
                      price: 29.99,
                      image: "pikachu-onesie-boy.png")

pokemon.items.create(title: "Young Pikachu - Girl",
                      description: description,
                      price: 29.99,
                      image: "pikachu-onesie-girl.png")

zebra.items.create(title: "Adult Zebra",
                      description: description,
                      price: 29.99,
                      image: "zebra-onesie.png")

sloth.items.create(title: "Adult Sloth",
                      description: description,
                      price: 69.99,
                      image: "sloth-onesie.png")


user1 = User.create(first_name: "Tester", last_name: "McTesty", email: "testerson@testmail.com", password: "testing", address: "1111")

order_1 = user1.orders.create(status: "ordered")
OrderItem.create(item_id: 2, order: order_1, quantity:2)
OrderItem.create(item_id: 1, order:order_1, quantity:1)

user2 = User.create(first_name: "SoTesty", last_name: "DeTest", email:"test@testmail.com", password: "testing", address: "1111")

order_2 = user2.orders.create(status: "completed")
OrderItem.create(item_id: 1, order:order_2, quantity:2)

order_3 = user2.orders.create(status: "completed")
OrderItem.create(item_id: 1, order:order_3, quantity:2)

user3 = User.create(first_name: "BestTest", last_name: "ReTest", email:"testing@testmail.com", password: "testing", address: "1111")

order_4 = user3.orders.create(status: "completed")
OrderItem.create(item_id: 2, order:order_4, quantity:2)
