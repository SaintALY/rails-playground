# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Topten.destroy_all
Railswiki.destroy_all

puts "Creating Top Ten Lists..."
# SEEDS for Top Tens
u_station = { name: "Heinrich-Heine-Strasse", comment: "has no elevator", address: "www.somestation.de", stars: 4 }
s_station =  { name: "Jannowitz Brucke", comment: "is being renovated", address: "www.station.de", stars: 3 }
# SEEDS for Rails Wiki
wiki_a = { title: "CRUD", content: "rails new preojectname = generates a new rails app", wiki_url: "www.lewagon.com", wiki_tag: "essential, beginner" }
wiki_b = { title: "Front End", content: "Fingerprinting is important", wiki_url: "www.lewagon.com", wiki_tag: "frontend, advanced" }
# Creating Top Tens seeds
[ u_station, s_station ].each do |attributes|
  topten = Topten.create!(attributes)
  puts "Created #{topten.name}"
end
# Creating Rails Wiki seeds
[ wiki_a, wiki_b ].each do |attributes|
  wiki = Railswiki.create!(attributes)
  puts "Created #{wiki.name}"
end
puts "Finished!"