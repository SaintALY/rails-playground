# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Topten.destroy_all

puts "Creating Top Ten Lists..."
u_station = { name: "Heinrich-Heine-Strasse", comment: "has no elevator" address: "www.somestation.de", stars: 4 }
s_station =  { name: "Jannowitz Brucke", comment: "is being renovated" address: "www.station.de", stars: 3 }

[ u_station, s_station ].each do |attributes|
  topten = Topten.create!(attributes)
  puts "Created #{topten.name}"
end
puts "Finished!"