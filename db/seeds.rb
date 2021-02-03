# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@admin',
  encrypted_password: 'aaaaaa'
)

room = Room.find(:id)
room.image.attach(io: File.open('app/assets/images/room.jpg'), filename: 'room.jpg')

Room.create!(
  name: "type1",
  body: "type1",
  price: "13000",
  people: "2",
  capacity: "10",
  reserved_flag: true
)