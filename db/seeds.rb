# Category.destroy_all
Item.destroy_all
User.destroy_all
Order.destroy_all

User.create(first_name: "Mimi", last_name: "Le", email: "mimi@mimi.com", password: "mimi", address: "666 Spooky Ave, Halloween City, NO 66666", role: 1)
user_1 = User.create!(first_name: "Ricky", last_name: "Hoola", email: "ricky@ricky.com", password: "ricky", address: "1111 Hoola Hoop Drive, Big Island, HI 90505", role: 0)
user_2 = User.create(first_name: "Sam", last_name: "Snider", email: "sam@sam.com", password: "sam", address: "1000 Sunny Dr., Sunshine, CO 10000", role: 0)
user_3 = User.create(first_name: "Kali", last_name: "Bike Rider", email: "kali@biking.com", password: "bike", address: "1010 Biking Home, Cool CA 10101", role: 0)

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

statuses = ["ordered", "paid", "cancelled", "completed"]
users = [user_1.id, user_2.id, user_3.id]

statuses.each do |status|
  users.each do |user|
    Order.create(status: status, user_id: user)
  end
end


Order.all.each do |order|
  order.items << Item.all.sample
end

OrderItem.all.each do |order_item|
  order_item.quantity = rand(1..10)
  order_item.save!
end
