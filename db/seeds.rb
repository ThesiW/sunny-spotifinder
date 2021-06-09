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
url_2 = "https://thatsup.se/stockholm/explore/cafe/"

p "I am there+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
html_file = URI.open(url_2).read
html_doc = Nokogiri::HTML(html_file)
p "I am here+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

html_doc.search('.explore-item').each do |element|
   spot_number = element.search('span')[1].text if element.search('span')[1].present?
   spot_name = element.search('span')[2].text.first(20) if element.search('span')[2].present?
   spot_address = element.search('span')[3].text if element.search('span')[3].present?
   spot_picture = element.search(".float-right").search("img").attr('src').value if element.search(".float-right").search("img").present?
   spot_link = element.search(".profile-link").attr('href').value
   p spot_link = "https://thatsup.se" + spot_link
   if spot_link.ascii_only?
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
   hours: hours
   )
   spot.photos.attach(io: URI.open(spot_picture), filename: 'picture', content_type: 'image/jpg') if spot_picture
   spot.save if element.search(".float-right").search("img").present?
   p spot.valid?
   p spot
end

