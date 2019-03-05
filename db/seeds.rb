# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Booking.destroy_all
Bike.destroy_all
User.destroy_all
puts "db cleaned"

users = []
5.times do |i|
  users << User.create(email: "t#{i}@gmail.com", password: "azertyui")
end

bikes = []
5.times do |i|
  bikes << Bike.create(name: "velo #{i} bleu", user: users[i], price: "10€", city: "Paris", zipcode: 75004)
end

Booking.create(bike: bikes[1], user: users[0])
Booking.create(bike: bikes[2], user: users[0])
Booking.create(bike: bikes[0], user: users[1])

puts "db created"
