require 'faker'
Review.destroy_all
Bookmark.destroy_all
Visit.destroy_all
Favourite.destroy_all
Spot.destroy_all
User.destroy_all

max = User.create(email: "maxrapp@gmail.com", password: "123456", username: "sunnyboy", intake: 0)
thesi = User.create(email: "theresa@gmail.com", password: "123456", username: "ThesiW", intake: 0)
samir = User.create(email: "samir@gmail.com", password: "123456", username: "Sami", intake: 0)
vincent = User.create(email:"vincent@gmail.com", password: "123456", username: "vincent", intake: 0)

require 'open-uri'
require 'nokogiri'
url = "https://www.google.fr/maps/search/caf%C3%A9/@59.316308,18.0746053,14z/data=!3m1!4b1"
url_2 = "https://thatsup.se/stockholm/explore/s%C3%B6dermalm/cafe/uteservering/"

p "I am there+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
html_file = URI.open(url_2).read
html_doc = Nokogiri::HTML(html_file)
p "I am here+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

html_doc.search('.explore-item').each do |element|
  p "starting ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
   spot_number = element.search('span')[1].text if element.search('span')[1].present?
   spot_name = element.search('span')[2].text.first(20) if element.search('span')[2].present?
   spot_address = element.search('span')[3].text if element.search('span')[3].present?
   spot_picture = element.search(".float-right").search("img").attr('src').value if element.search(".float-right").search("img").present?
   spot_link = element.search(".profile-link").attr('href').value
   p spot_link
   p spot_link = "https://thatsup.se" + spot_link
   if spot_link.ascii_only?
     html_file2 = URI.open(spot_link).read
     html_doc2 = Nokogiri::HTML(html_file2)
     hours = html_doc2.search('.opening-hour').first.text if html_doc2.search('.opening-hour').first
     spot_description = html_doc2.search('.body-text').text.first(200)

     p spot_description

   html_file2 = URI.open(spot_link).read
   html_doc2 = Nokogiri::HTML(html_file2)
   hours = html_doc2.search('.opening-hour').first.text if html_doc2.search('.opening-hour').first
    p hours
   end
   if spot_picture == nil
     spot_picture = "https://images.unsplash.com/photo-1552566626-52f8b828add9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
   end

   spot_picture = element.search(".float-right").search("img").attr('src').value if element.search(".float-right").search("img").present?
   puts "Name of the spot: #{spot_name}"
   puts "Address of the spot: #{spot_address}"
   spot = Spot.new(
   name: spot_name,
   address: spot_address,
   rating: rand(1..5),
   hours: hours,
   description: spot_description
   )

   spot.photos.attach(io: URI.open(spot_picture), filename: 'picture', content_type: 'image/jpg') if spot_picture
   spot.save if element.search(".float-right").search("img").present?
   p spot.valid?
   p spot
   if spot_name == "Cykelcafé Le Mond"
    spot.latitude = 59.31449142762766
    spot.longitude = 18.079939340863586
    spot.save
   end
   p "over ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

   if spot_name == "Kaferang"
    spot.latitude = 59.312839129751545
    spot.longitude = 18.083514259061587
    spot.save
   end
   if spot_name == "Älskade Traditioner"
    spot.latitude = 59.31103965115214
    spot.longitude = 18.08156107300887
    spot.save
   end
   if spot_name == "Fern & Fika"
    spot.latitude = 59.31717118240935
    spot.longitude = 18.033048797139948
    spot.save
   end
   if spot_name == "Mahalo Söder"
    spot.latitude = 59.31779066674081
    spot.longitude = 18.054273325736578
    spot.save
   end
   if spot_name == "Gildas Rum"
    spot.latitude = 59.31278626640587
    spot.longitude = 18.083177281254343
    spot.save
   end
   if spot_name == "Pom & Flora Bondegatan"
    spot.latitude = 59.31378970800266
    spot.longitude = 18.08662255116376
    spot.save
   end
   if spot_name == "Johan & Nyström Swedenborgsgatan"
    spot.latitude = 59.31627077731745
    spot.longitude = 18.064051363280093
    spot.save
   end
   if spot_name == "Vurma Hornstull"
    spot.latitude = 59.31546411839941
    spot.longitude = 18.029537504884097
    spot.save
   end

   if spot_name == "Greasy Spoon Tjärhovsgatan"
    spot.latitude = 59.3159022870926
    spot.longitude = 18.081713443779428
    spot.save
   end

   if spot_name == "Lykke Kaffegårdar Nytorget"
    spot.latitude = 59.313318873707246
    spot.longitude = 18.082189535092297
    spot.save
   end
 end


