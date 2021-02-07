# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@admin',
  password: 'aaaaaa'
)

Room.create!(
  name: "type1",
  body: "type1",
  price: "11000",
  people: "2",
  capacity: "10",
  reserved_flag: false
)
Room.create!(
  name: "type2",
  body: "type2",
  price: "12000",
  people: "2",
  capacity: "5",
  reserved_flag: false
)
Room.create!(
  name: "type3",
  body: "type3",
  price: "13000",
  people: "4",
  capacity: "3",
  reserved_flag: false
)

room = Room.find(1)
room.image.attach(io: File.open('app/assets/images/room1.jpg'), filename: 'room1.jpg')
room2 = Room.find(2)
room2.image.attach(io: File.open('app/assets/images/room2.jpg'), filename: 'room2.jpg')
room3 = Room.find(3)
room3.image.attach(io: File.open('app/assets/images/room3.jpg'), filename: 'room3.jpg')