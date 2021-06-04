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


Review.destroy_all
Bookmark.destroy_all
Visit.destroy_all
Favourite.destroy_all
Spot.destroy_all
User.destroy_all

max = User.create(email: "maxrapp@gmail.com", password: "123456", username: "sunnyboy")
thesi = User.create(email: "theresa@gmail.com", password: "123456", username: "ThesiW")
samir = User.create(email: "samir@gmail.com", password: "123456", username: "Sami")
vincent = User.create(email:"vincent@gmail.com", password: "123456", username: "vincent")

10.times do
  spot = Spot.new(
    name: Faker::Restaurant.name,
    address: "Stockholm",
    rating: rand(1..5),
    description: "Great spot!",
    link: "https://www.kvarnen.com/",
    sun_start: "06:35",
    sun_end: "20:35"
    )
spot.photo.attach(io: URI.open('https://images.unsplash.com/photo-1552566626-52f8b828add9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80'), filename: 'picture', content_type: 'image/jpg')
spot.save
end
sp = Spot.create(name: "Kvarnen", address: "Medborgarplatsen, Stockholm", rating: rand(1..5), description: "Great spot", link: "https://www.kvarnen.com/", sun_start: 0635, sun_end: 2035)

1.times do
  Review.create!(
    rating: rand(1..5),
    comment: "Good overall experience",
    spot: Spot.all.sample,
    user:  User.all.sample
    )
end

1.times do
  Bookmark.create!(
    status: true,
    spot: Spot.all.sample,
    user: User.all.sample
    )
end

1.times do
  Visit.create!(
    spot: Spot.all.sample,
    user: User.all.sample
    )
end

1.times do
  Favourite.create!(
    status: true,
    spot: Spot.all.sample,
    user: User.all.sample
    )
end

