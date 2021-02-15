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
  body: "広さは３０平米と少しコンパクトとになっていますがリーズナブルな価格でご利用いただけます。
        インテリアや雑貨にもこだわり、とてもお洒落な内装になっています！段差がないのでバリアフリーにも対応しております。
          ",
  price: "18000",
  people: "2",
  capacity: "10",
  reserved_flag: false
)
Room.create!(
  name: "type2",
  body: "グレーと白を基調とした部屋でとても落ち着いた雰囲気のある部屋です。大きな窓からは綺麗な景色を眺めることができます。
        また、広いお風呂が特徴的で中にはジャグジーとテレビもついています！アメニティも豊富に揃えているのでぜひご利用ください。",
  price: "25000",
  people: "2",
  capacity: "5",
  reserved_flag: false
)
Room.create!(
  name: "type3",
  body: "当ホテルの中で一番広い部屋です！大きいテレビとソファがあり、広いキッチンに調理器具が付いているので料理ができます。
        キングサイズのベッドなので添い寝も可能です。家族連れにも人気の部屋です。",
  price: "40000",
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