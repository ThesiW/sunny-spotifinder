require 'faker'

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


drop = Spot.create(
  name: "Drop Coffee",
  address: "Wollmar Yxkullsgatan 10, Stockholm",
  rating: rand(1..5), description: "Great spot",
  link: "https://www.dropcoffee.com/",
  sun_start: "06:35",
  sun_end: "20:35"
 )

['https://cdn.shopify.com/s/files/1/0235/7459/t/18/assets/footer_slide_3.png?v=16230210995616577380', 'https://www.allakartor.se/venue_images_475/148882_48446780.jpg', 'https://www.allakartor.se/venue_images_475/148882_37427961.jpg'].each do |url|
  drop.photos.attach(io: URI.open(url), filename: 'picture', content_type: 'image/jpg')
end
drop.save!

# ----

lykke = Spot.create(
  name: "Lykke",
  address: "Nytorgsgatan 38, Stockholm",
  rating: rand(1..5),
  description: "Cool, great atmosphere and relaxed place, nice selection of sandwiches and cakes, great coffee, nice selection of wines too.",
  link: "https://www.lykkegardar.se/",
  sun_start: "06:35",
  sun_end: "20:35"
  )

['https://i.shgcdn.com/fe5b943a-0627-43d5-9df8-0ee876eabed8/-/format/auto/-/preview/3000x3000/-/quality/lighter/', 'https://i.shgcdn.com/362b4de2-70cf-4d4c-9591-2df6b6ed7fd9/-/format/auto/-/preview/3000x3000/-/quality/lighter/', 'https://i.shgcdn.com/362b4de2-70cf-4d4c-9591-2df6b6ed7fd9/-/format/auto/-/preview/3000x3000/-/quality/lighter/'].each do |url|
  lykke.photos.attach(io: URI.open(url), filename: 'picture', content_type: 'image/jpg')
end
lykke.save!

# ----

kaffe = Spot.create(
  name: "Kaffe",
  address: "Sankt Paulsgatan 17, Stockholm",
  rating: rand(1..5), description: "Great spot",
  link: "https://www.tripadvisor.com/Restaurant_Review-g189852-d3530028-Reviews-Kaffe-Stockholm.html",
  sun_start: "06:35",
  sun_end: "20:35"
  )

['https://static.thatsup.co/content/img/place/k/a/user-photo/e2a3794a.jpg', 'https://static.thatsup.co/content/img/place/k/a/user-photo/4e372d49_1.jpg', 'https://media-cdn.tripadvisor.com/media/photo-s/0f/29/22/57/photo2jpg.jpg'].each do |url|
  kaffe.photos.attach(io: URI.open(url), filename: 'picture', content_type: 'image/jpg')
end
kaffe.save!

# ----

johan = Spot.create(
  name: "Johan & Nyström",
  address: "Swedenborgsgatan 7, Stockholm",
  rating: rand(1..5),
  description: "Great spot",
  link: "https://johanochnystrom.com/",
  sun_start: "06:35",
  sun_end: "20:35"
  )

['https://media-cdn.tripadvisor.com/media/photo-s/13/81/0c/f8/sommar-pa-swedenborgsgatan.jpg', 'https://media-cdn.tripadvisor.com/media/photo-l/0a/2f/07/f0/photo0jpg.jpg'].each do |url|
  johan.photos.attach(io: URI.open(url), filename: 'picture', content_type: 'image/jpg')
end
johan.save!
# ----

kvarnen = Spot.create(
  name: "Kvarnen",
  address: "Medborgarplatsen, Stockholm",
  rating: rand(1..5),
  description: "Great spot",
  link: "https://www.kvarnen.com/",
  sun_start: "06:35",
  sun_end: "20:35"
  )

['https://images.unsplash.com/photo-1552566626-52f8b828add9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2850&q=80'].each do |url|
  kvarnen.photos.attach(io: URI.open(url), filename: 'picture', content_type: 'image/jpg')
end
kvarnen.save!

# ----

kaffebar = Spot.create(
  name: "Kaffebar",
  address: "Bysistorget 6, Stockholm",
  rating: rand(1..5),
  description: "Great spot",
  link: "https://www.afar.com/places/mellqvist-kaffebar-stockholm",
  sun_start: "06:35",
  sun_end: "20:35"
  )

['https://lh5.googleusercontent.com/p/AF1QipPU_9BNYpDx7e9N3g1CJkDaRJK88wZs26JStuGK=s1353-k-no', 'https://lh5.googleusercontent.com/p/AF1QipOZn-eTyk-qB_bfS93BtppLAPgzbTOtQRkNwOxr=s1160-k-no', 'https://lh5.googleusercontent.com/p/AF1QipP_X756blPxHz8IgBqL17xPthcFbClu-iExzK0w=s1160-k-no'].each do |url|
  kaffebar.photos.attach(io: URI.open(url), filename: 'picture', content_type: 'image/jpg')
end
kaffebar.save!



# ----

beck = Spot.create(
  name: "Beck Kaffebar",
  address: "Tjärhovsgatan 3, Stockholm",
  rating: rand(1..5),
  description: "Great spot",
  link: "https://www.tripadvisor.com/Restaurant_Review-g189852-d15010655-Reviews-Beck_Kaffebar-Stockholm.html",
  sun_start: "06:35",
  sun_end: "20:35"
  )
['https://lh5.googleusercontent.com/p/AF1QipOfQyes38nW_7qjDchrDGBBYEDVGUAgmb7AMPm4=s825-k-no', 'https://lh5.googleusercontent.com/p/AF1QipNN-u8WQHfvtawt6Kb95zloIVUWcfrNZjgD8Hg_=s619-k-no', 'https://lh5.googleusercontent.com/p/AF1QipNN-u8WQHfvtawt6Kb95zloIVUWcfrNZjgD8Hg_=s619-k-no'].each do |url|
  beck.photos.attach(io: URI.open(url), filename: 'picture', content_type: 'image/jpg')
end
beck.save!


 Bookmark.create!(
    status: true,
    spot: beck,
    user: max
    )

# ----

  Visit.create!(
    spot: beck,
    user: max
    )

pascal = Spot.create(
  name: "Café Pascal",
  address: "Skånegatan 76, Stockholm",
  rating: rand(1..5),
  description: "They serve soup and sandwiches for lunch. Very cosy place!",
  link: "https://cafepascal.se/",
  sun_start: "06:35",
  sun_end: "20:35"
  )
['https://lh5.googleusercontent.com/p/AF1QipPKeb_AciRSEgmdzqbyvOpwo3jjYB_yl8YEoW8G=s812-k-no', 'https://lh5.googleusercontent.com/p/AF1QipM9l8kZyieKjcZVhlNH3gk4S9gYxyYimIiql9lu=s1031-k-no', 'https://lh5.googleusercontent.com/p/AF1QipPGEw6pCQgS0IO3qaaeqIodSpaUXhhCwgJwyh7B=s773-k-no'].each do |url|
  pascal.photos.attach(io: URI.open(url), filename: 'picture', content_type: 'image/jpg')
end
pascal.save!

# ----

savant = Spot.create(
  name: "Savant Bar",
  address: "Tegnérgatan 4, Stockholm",
  rating: rand(1..5),
  description: "Amazing food. Cool owner. Nice vibes. Great for natural wine lovers",
  link: "https://www.savantbar.se/",
  sun_start: "06:35",
  sun_end: "20:35" 
  )

['https://images.squarespace-cdn.com/content/v1/5dcfbd9af1a7771855d1d15d/1576658667545-J60L21SZA0QWYVHW5LQL/ke17ZwdGBToddI8pDm48kOggE0Ch6pMGalwtLMqzsSB7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1Ufo5RWkg_J4of0jUNHaDHx6pZKBvpVYzidBWCapg0tuoMuEaB2HPGSYDV-11UTcW2g/_P8A8480_SAVANT_web.jpg', 'https://lh5.googleusercontent.com/p/AF1QipObGXolb5AoMbEnT0PVoprQBG4i3YlKCH20IC-2=s1083-k-no', 'https://lh5.googleusercontent.com/p/AF1QipMR_eRVuXVCz0EtRwvJT0Rrt-4WNmPSYFJZckPD=s1083-k-no'].each do |url|
  savant.photos.attach(io: URI.open(url), filename: 'picture', content_type: 'image/jpg')
end
savant.save!

Favourite.create!(
    status: true,
    spot: beck,
    user: max
    )



# 10.times do
#   Review.create!(
#     rating: rand(1..5),
#     comment: "Good overall experience",
#     spot: Spot.all.sample,
#     user:  User.all.sample
#     )
# end

# 10.times do
#   Bookmark.create!(
#     status: true,
#     spot: Spot.all.sample,
#     user: User.all.sample
#     )
# end

# 10.times do
#   Visit.create!(
#     spot: Spot.all.sample,
#     user: User.all.sample
#     )
# end

# 10.times do
#   Favourite.create!(
#     status: true,
#     spot: Spot.all.sample,
#     user: User.all.sample
#     )
# end








































