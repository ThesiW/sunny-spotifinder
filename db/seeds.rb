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
    sun_start: 0635,
    sun_end: 2035
    )
spot.photo.attach(io: URI.open('https://images.unsplash.com/photo-1552566626-52f8b828add9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80'), filename: 'picture', content_type: 'image/jpg')
spot.save
end
kvarnen = Spot.create(name: "Kvarnen", address: "Medborgarplatsen, Stockholm", rating: rand(1..5), description: "Great spot", link: "https://www.kvarnen.com/", sun_start: 0635, sun_end: 2035)

drop = Spot.create(name: "Drop Coffee", address: "Wollmar Yxkullsgatan 10, Stockholm", rating: rand(1..5), description: "Great spot", link: "https://www.dropcoffee.com/", sun_start: 0635, sun_end: 2035)
drop
kaffe = Spot.create(name: "Kaffe", address: "Sankt Paulsgatan 17, Stockholm", rating: rand(1..5), description: "Great spot", link: "https://www.tripadvisor.com/Restaurant_Review-g189852-d3530028-Reviews-Kaffe-Stockholm.html", sun_start: 0635, sun_end: 2035)

johan = Spot.create(name: "Johan & Nystrom", address: "Swedenborgsgatan 7, Stockholm", rating: rand(1..5), description: "Great spot", link: "https://johanochnystrom.com/", sun_start: 0635, sun_end: 2035)
kaffebar = Spot.create(name: "Kaffebar", address: "Bysistorget 6, Stockholm", rating: rand(1..5), description: "Great spot", link: "https://www.afar.com/places/mellqvist-kaffebar-stockholm", sun_start: 0635, sun_end: 2035)
beck = Spot.create(name: "Beck Kaffebar", address: "Tjärhovsgatan 3, Stockholm", rating: rand(1..5), description: "Great spot", link: "https://www.tripadvisor.com/Restaurant_Review-g189852-d15010655-Reviews-Beck_Kaffebar-Stockholm.html", sun_start: 0635, sun_end: 2035)
delico = Spot.create(name: "Delico Kaffehandel", address: "Medborgarplatsen 3, Stockholm", rating: rand(1..5), description: "Great spot", link: "https://www.soderhallarna.se/soderhallarna-a-o/delico/", sun_start: 0635, sun_end: 2035)
fatol = Spot.create(name: "Fatoljen", address: "Gotgatan 14, Stockholm", rating: rand(1..5), description: "Great spot", link: "http://cafefatoljen.com/", sun_start: 0635, sun_end: 2035)
wayne = Spot.create(name: "Waynes Coffee", address: "Gotgatan 31, Stockholm", rating: rand(1..5), description: "Great spot", link: "https://www.waynescoffee.se/kafe/waynes-stockholm-gotgatan-31/", sun_start: 0635, sun_end: 2035)
cykel = Spot.create(name: "Cykelcafé Le Mond", address: "Sodermannnagatan, Stockholm", rating: rand(1..5), description: "Great spot", link: "https://cykelcafe.se/", sun_start: 0635, sun_end: 2035)

10.times do
Review.create!(
    rating: rand(1..5),
    comment: "Good overall experience",
    spot: Spot.all.sample,
    user:  User.all.sample
    )
end

10.times
  do
  Bookmark.create!(
    status: true,
    spot: Spot.all.sample,
    user: User.all.sample
    )
end

10.times do
  Visit.create!(
    spot: Spot.all.sample,
    user: User.all.sample
    )
end

10.times do
  Favourite.create!(
    status: true,
    spot: Spot.all.sample,
    user: User.all.sample
    )
end

