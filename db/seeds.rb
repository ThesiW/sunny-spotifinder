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
User.destroy_all
Spot.destroy_all
Review.destroy_all
Bookmark.destroy_all
Visit.destroy_all

10.times do
  User.create!(
    username: Faker::Name.name_with_middle,
    email: Faker::Internet.free_email,
    password: "123456",
    )
end

10.times do
  spot = Spot.new(
    address: "Stockholm",
    rating: rand(1..5),
    description: Faker::Restaurant.name,
    link: "https://www.kvarnen.com/",
    sun_start: 0635,
    sun_end: 2035,
    created_at: 20210601,
    updated_at: 20210601
    )
spot.photo.attach(io: URI.open('https://unsplash.com/photos/Ciqxn7FE4vE'), filename: 'picture', content_type: 'image/jpg')
spot.save
end

10.times do
  Review.create!(
    rating: rand(1..5),
    comment: "Good overall experience",
    spot: Spot.all.sample,
    user:  User.all.sample,
    created_at: 20210601,
    updated_at: 20210601
    )
end

10.times do
  Bookmark.create!(
    status: true,
    spot: Spot.all.sample,
    user: User.all.sample,
    created_at: 20210601,
    updated_at: 20210601
    )
end

10.times do
  Visit.create!(
    spot: Spot.all.sample,
    user: User.all.sample,
    created_at: 20210601,
    updated_at: 20210601
    )
end


