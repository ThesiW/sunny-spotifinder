require 'faker'
Review.destroy_all
Bookmark.destroy_all
Visit.destroy_all
Favourite.destroy_all
Spot.destroy_all
User.destroy_all

# max = User.create(email: "maxrapp@gmail.com", password: "123456", username: "Max", intake: 0)
thesi = User.create(email: "theresa@gmail.com", password: "123456", username: "ThesiW", intake: 0)
samir = User.create(email: "samir@gmail.com", password: "123456", username: "Sami", intake: 0)
vincent = User.create(email:"vincent@gmail.com", password: "123456", username: "vincent", intake: 0)

pic_four = URI.open('https://kitt.lewagon.com/placeholder/users/claire-gtr')
claire = User.create(email: "claire@gmail.com", password: "123456", username: "claireG", intake:0)
claire.picture.attach(io: pic_four, filename: 'nes.png', content_type: 'image/png')

pic_six = URI.open('https://kitt.lewagon.com/placeholder/users/anacolell')
ana = User.create(email:"ana@gmail.com", password: "123456", username: "ana", intake: 0)
ana.picture.attach(io: pic_six, filename: 'nes.png', content_type: 'image/png')

pic_seven = URI.open('https://kitt.lewagon.com/placeholder/users/brittafe')
britta = User.create(email: "britta@gmail.com", password: "123456", username: "britta", intake:0)
britta.picture.attach(io: pic_seven, filename: 'nes.png', content_type: 'image/png')

pic_eight = URI.open('https://kitt.lewagon.com/placeholder/users/danielareijs')
daniela = User.create(email: "daniela@gmail.com", password: "123456", username: "dani", intake:0)
daniela.picture.attach(io: pic_eight, filename: 'nes.png', content_type: 'image/png')

pic_ten = URI.open('https://kitt.lewagon.com/placeholder/users/dittojoe')
joe = User.create(email: "joe@gmail.com", password: "123456", username: "joseph", intake:0)
joe.picture.attach(io: pic_ten, filename: 'nes.png', content_type: 'image/png')

pic_five = URI.open('https://kitt.lewagon.com/placeholder/users/rappmax')
max = User.create(email: "maxrapp@gmail.com", password: "123456", username: "Max", intake:0)
max.picture.attach(io: pic_five, filename: 'nes.png', content_type: 'image/png')


require 'open-uri'
require 'nokogiri'
url = "https://www.google.fr/maps/search/caf%C3%A9/@59.316308,18.0746053,14z/data=!3m1!4b1"
url_2 = "https://thatsup.se/stockholm/explore/s%C3%B6dermalm/cafe/uteservering/"

p "I am there+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
html_file = URI.open(url_2).read
html_doc = Nokogiri::HTML(html_file)
p "I am here+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

html_doc.search('.explore-item').each do |element|
  # p "starting ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
   spot_number = element.search('span')[1].text if element.search('span')[1].present?
   spot_name = element.search('span')[2].text.first(20) if element.search('span')[2].present?
   spot_address = element.search('span')[3].text if element.search('span')[3].present?
   spot_picture = element.search(".float-right").search("img").attr('src').value if element.search(".float-right").search("img").present?
   spot_link = element.search(".profile-link").attr('href').value
   p spot_picture
   p spot_link = "https://thatsup.se" + spot_link
   if spot_link.ascii_only?
     html_file2 = URI.open(spot_link).read
     html_doc2 = Nokogiri::HTML(html_file2)
     hours = html_doc2.search('.opening-hour').first.text if html_doc2.search('.opening-hour').first
     spot_description = html_doc2.search('.body-text > p:nth-child(2)').text

     p spot_description

   html_file2 = URI.open(spot_link).read
   html_doc2 = Nokogiri::HTML(html_file2)
   hours = html_doc2.search('.opening-hour').first.text if html_doc2.search('.opening-hour').first
    p hours
   end
   if spot_picture == nil
     spot_picture = "https://images.unsplash.com/photo-1552566626-52f8b828add9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
   end
   if spot_description == nil
     spot_description = "Beställ en saftig variant med cream cheese eller en lättare lunch och slå er sedan ned på uteserveringen som är perfekt för soliga dagar."
   end

   spot_picture = element.search(".float-right").search("img").attr('src').value if element.search(".float-right").search("img").present?
   puts "Name of the spot: #{spot_name}"

   # puts "Address of the spot: #{spot_address}"
   puts "Address of the spot: #{spot_address}"
   sun_hour_start = "#{rand(7..11)}:#{rand(10..59)}"
   sun_end = "#{rand(17..21)}:#{rand(10..59)}"
   spot = Spot.new(
   name: spot_name,
   address: spot_address,
   rating: rand(1..5),
   description: spot_description,
   sun_start: sun_hour_start,
   sun_end: sun_end
   )

   spot.hours = hours unless hours.nil?

   spot.photos.attach(io: URI.open(spot_picture), filename: 'picture', content_type: 'image/jpg') if spot_picture
   spot.save
   p "INFOS"
   p spot.valid?
   p spot.errors.message unless spot.valid?
   p spot
   p "------------"
   if spot_name == "Cykelcafé Le Mond"
    spot.latitude = 59.31449142762766
    spot.longitude = 18.079939340863586
    spot.save
   end
   # p "over ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

   if spot_name == "Kaferang"
    spot.latitude = 59.312839129751545
    spot.longitude = 18.083514259061587
    spot.save
    # pic_four = URI.open('https://kitt.lewagon.com/placeholder/users/claire-gtr')
    # claire = User.create(review:"Best food I ever had." )
    # claire.picture.attach(io: pic_four, filename: 'nes.png', content_type: 'image/png')
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

   if spot_name == "Bazzar"
    spot.latitude = 59.31368322421927
    spot.longitude = 18.09082762414505
    spot.save
   end

   comments = ["very disappointed chicken was oily outdoor area wasn't sunny ",
                "it's not super good decent place.",
                "To who may it concern.
                  Lovely brunch and staff made me feel like home in Louisiana! love those salad was little soggy. for sure we return",
                "Ooohh my god what an amazing brunch in a sun I wonder is it always that sunny there :p",
                  "will definitely go there again amazing food, crispy chicken with chiled beer in there sunny spot must try!"]
   rating = rand(1..5)
   claire_rating = rand(1..5)
   ana_rating = rand(1..5)
   britta_rating = rand(1..5)
   dani_rating = rand(1..5)
   joseph_rating = rand(1..5)
   max_rating = rand(1..5)


  Review.create(rating:rating,comment:comments[rating - 1],spot:spot,user:samir) if spot.save
  Review.create(rating:claire_rating,comment:comments[claire_rating - 1],spot:spot,user:claire) if spot.save
  Review.create(rating:ana_rating,comment:comments[ana_rating - 1],spot:spot,user:ana) if spot.save
  Review.create(rating:britta_rating,comment:comments[britta_rating - 1],spot:spot,user:britta) if spot.save
  Review.create(rating:dani_rating,comment:comments[dani_rating - 1],spot:spot,user:daniela) if spot.save
  Review.create(rating:joseph_rating,comment:comments[joseph_rating - 1],spot:spot,user:joe) if spot.save
  Review.create(rating:max_rating,comment:comments[max_rating - 1],spot:spot,user:max) if spot.save
 end


