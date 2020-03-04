# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

keyboard = Product.new(
  name: "Mechanical Keyboard",
  price: 95.0,
  image_url: "",
  description: "Cherry switch echanical keyboard with bluetooth",
)
keyboard.save
