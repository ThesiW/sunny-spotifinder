# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
# max = User.create(email: "maxrapp@gmail.com", password: "123456", username: "max")
# thesi = User.create(email: "theresa@gmail.com", password: "123456", username: "thesi")
# samir = User.create(email: "samir@gmail.com", password: "123456", username: "samir")
# vincent = vincent = User.create(email:"vincent@gmail.com", password: "123456")

# restaurant_one = Faker::Restaurant.name

10.times do
  User.create(
    username: Faker::Name.name_with_middle,
    email: Faker::Internet.free_email,
    password: "123456"
    )
end

10.times do
  Spots.create(
    description: Faker::Restaurant.name,
    rating: rand(1..5)
    )
end
