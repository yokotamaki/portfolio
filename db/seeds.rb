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

Guest.create!(
  id: 1,
  name: Gimei.name.kanji,
  name_kana: Gimei.name.katakana,
  birthday: "1970-12-19",
  sex: true,
  zipcode: "1111111",
  address: Gimei.address.kanji,
  phone_number: "09000000000",
  email: "test@test",
  created_at: "2021-02-19"
  )
Guest.create!(
  id: 2,
  name: Gimei.name.kanji,
  name_kana: Gimei.name.katakana,
  birthday: "1990-05-11",
  sex: true,
  zipcode: "1111111",
  address: Gimei.address.kanji,
  phone_number: "09000000000",
  email: "test2@test",
  created_at: "2021-02-20"
  )
Guest.create!(
  id: 3,
  name: Gimei.name.kanji,
  name_kana: Gimei.name.katakana,
  birthday: "1955-03-01",
  sex: true,
  zipcode: "1111111",
  address: Gimei.address.kanji,
  phone_number: "09000000000",
  email: "test3@test",
  created_at: "2021-02-20"
  )
Guest.create!(
  id: 4,
  name: Gimei.name.kanji,
  name_kana: Gimei.name.katakana,
  birthday: "1990-10-15",
  sex: true,
  zipcode: "1111111",
  address: Gimei.address.kanji,
  phone_number: "09000000000",
  email: "test4@test",
  created_at: "2021-02-21"
  )
Guest.create!(
  id: 5,
  name: Gimei.name.kanji,
  name_kana: Gimei.name.katakana,
  birthday: "2000-01-01",
  sex: true,
  zipcode: "1111111",
  address: Gimei.address.kanji,
  phone_number: "09000000000",
  email: "test5@test",
  created_at: "2021-02-23"
  )
Guest.create!(
  id: 6,
  name: Gimei.name.kanji,
  name_kana: Gimei.name.katakana,
  birthday: "1998-06-26",
  sex: true,
  zipcode: "1111111",
  address: Gimei.address.kanji,
  phone_number: "09000000000",
  email: "test6@test",
  created_at: "2021-02-28"
  )
Guest.create!(
  id: 7,
  name: Gimei.name.kanji,
  name_kana: Gimei.name.katakana,
  birthday: "1995-04-30",
  sex: false,
  zipcode: "1111111",
  address: Gimei.address.kanji,
  phone_number: "09000000000",
  email: "test7@test",
  created_at: "2021-03-03"
  )
Guest.create!(
  id: 8,
  name: Gimei.name.kanji,
  name_kana: Gimei.name.katakana,
  birthday: "1987-07-21",
  sex: true,
  zipcode: "1111111",
  address: Gimei.address.kanji,
  phone_number: "09000000000",
  email: "test8@test",
  created_at: "2021-03-04"
  )
Guest.create!(
  id: 9,
  name: Gimei.name.kanji,
  name_kana: Gimei.name.katakana,
  birthday: "1999-06-21",
  sex: false,
  zipcode: "1111111",
  address: Gimei.address.kanji,
  phone_number: "09000000000",
  email: "test9@test",
  created_at: "2021-03-10"
  )
Guest.create!(
  id: 10,
  name: Gimei.name.kanji,
  name_kana: Gimei.name.katakana,
  birthday: "1993-01-04",
  sex: false,
  zipcode: "1111111",
  address: Gimei.address.kanji,
  phone_number: "09000000000",
  email: "test10@test",
  created_at: "2021-03-12"
  )

Reservation.new(
  guest_id: 1,
  room_id: 2,
  start_date: "2021-03-01",
  end_date: "2021-03-02",
  people: 2,
  created_at: "2021-02-19"
  ).save(validate: false)
Reservation.new(
  guest_id: 2,
  room_id: 2,
  start_date: "2021-03--7",
  end_date: "2021-03-08",
  people: 2,
  created_at: "2021-02-20"
  ).save(validate: false)
Reservation.new(
  guest_id: 3,
  room_id: 2,
  start_date: "2021-03-15",
  end_date: "2021-03-16",
  people: 2,
  created_at: "2021-02-20"
  ).save(validate: false)
Reservation.new(
  guest_id: 4,
  room_id: 3,
  start_date: "2021-03-20",
  end_date: "2021-03-21",
  people: 4,
  created_at: "2021-02-21"
  ).save(validate: false)
Reservation.new(
  guest_id: 5,
  room_id: 1,
  start_date: "2021-03-12",
  end_date: "2021-03-13",
  people: 2,
  created_at: "2021-02-23"
  ).save(validate: false)
Reservation.new(
  guest_id: 6,
  room_id: 1,
  start_date: "2021-03-27",
  end_date: "2021-03-28",
  people: 2,
  created_at: "2021-02-28"
  ).save(validate: false)
Reservation.new(
  guest_id: 7,
  room_id: 3,
  start_date: "2021-04-04",
  end_date: "2021-04-05",
  people: 2,
  created_at: "2021-03-03"
  ).save(validate: false)
Reservation.new(
  guest_id: 8,
  room_id: 1,
  start_date: "2021-04-12",
  end_date: "2021-04-13",
  people: 2,
  created_at: "2021-03-04"
  ).save(validate: false)
Reservation.new(
  guest_id: 9,
  room_id: 3,
  start_date: "2021-03-30",
  end_date: "2021-03-31",
  people: 4,
  created_at: "2021-03-10"
  ).save(validate: false)
Reservation.new(
  guest_id: 10,
  room_id: 3,
  start_date: "2021-04-20",
  end_date: "2021-04-21",
  people: 4,
  created_at: "2021-03-12"
  ).save(validate: false)

Contact.create!(
  title: "充電器のコードを忘れてしまった",
  body: "以前宿泊した際、白いiPhone充電器のコードを忘れてしまいました。再度宿泊する予定があるので、それまで預けっておいていただきたいのですが可能でしょうか？",
  email: "test1@test",
  name: Gimei.name.kanji,
  created_at: "2021-02-01"
  )
Contact.create!(
  title: "貸し出しについて",
  body: "DVDプレイヤーの貸し出しはありますか？？",
  email: "test2@test",
  name: Gimei.name.kanji,
  created_at: "2021-02-15"
  )
Contact.create!(
title: "駐車場はありますか？？",
body: "今度宿泊する際、車で行く予定です。ホテルに駐車場はありますか？？また料金はいくらでしょうか？？",
email: "test3@test",
name: Gimei.name.kanji,
created_at: "2021-02-16"
)
Contact.create!(
title: "荷物の郵送について",
body: "到着前に荷物を郵送したいと考えています。その場合荷物は預かっていただけるのでしょうか？ もし預かっていただけるのであれば宛名などどのようにして送ればいいのでしょうか？",
email: "test4@test",
name: Gimei.name.kanji,
created_at: "2021-02-17"
)
Contact.create!(
title: "予約確認メールが届きません",
body: "3月1日から2名で予約を入れています。予約完了メールが届いていません。予約できているか不安なので確認していただきたいです。",
email: "tes5t@test",
name: Gimei.name.kanji,
created_at: "2021-02-17"
)
Contact.create!(
title: "利用できるクレジットカードについて",
body: "利用できるクレジットカードの種類が知りたいです。",
email: "test6@test",
name: Gimei.name.kanji,
created_at: "2021-02-18"
)
Contact.create!(
title: "部屋の中に靴下を忘れたかもしれない",
body: "宿泊した際に赤い靴下を置いていってしまったかもしれないので確認してください！もしあれば連絡お願いします。",
email: "test7@test",
name: Gimei.name.kanji,
created_at: "2021-02-19"
)
Contact.create!(
title: "チェックイン前に荷物を預かって欲しい",
body: "27日から１泊する予定なのですが、チェックイン前にだけ預かって欲しいです。預かっていただくことは可能でしょうか？",
email: "test8@test",
name: Gimei.name.kanji,
created_at: "2021-02-20"
)
Contact.create!(
title: "部屋の指定はできますか？？",
body: "子供が車椅子を利用しているのと年配の人がいるのででなるべくフロント空近い部屋がいいのですがどのようにすればいいでしょうか？また駐車場もなるべく近いところを利用したいです。",
email: "test9@test",
name: Gimei.name.kanji,
created_at: "2021-02-20"
)
Contact.create!(
title: "喫煙できますか？？",
body: "部屋は禁煙・喫煙のどちらでしょうか？ もし禁煙だとしたらどこか館内に喫煙スペースはありますか？",
email: "test10@test",
name: Gimei.name.kanji,
created_at: "2021-02-20"
)
Contact.create!(
title: "周辺の観光スポットを知りたい",
body: "ホテル周辺の観光スポットなどを教えてください。おすすめがあれば行ってみたいです！",
email: "test11@test",
name: Gimei.name.kanji,
created_at: "2021-02-21"
)
Contact.create!(
title: "ケーキを持ち込みたい",
body: "友達の誕生日祝いで宿泊したいと考えています。ケーキをサプライズで渡したいので事前に郵送して、部屋の中に入れておいていただきたいのですが可能でしょうか？",
email: "test12@test",
name: Gimei.name.kanji,
created_at: "2021-03-02"
)
Contact.create!(
title: "部屋から景色は見えますか？",
body: "部屋からはどんな景色が見れますか？？部屋タイプによって異なるのでしょうか？？詳細が知りたいです。",
email: "test13@test",
name: Gimei.name.kanji,
created_at: "2021-03-11"
)

comment = "また行きたいです"
Review.create!(
  star: 4.0,
  comment: comment,
  name: "はなこ",
  age: "２０代",
  sex: "女性",
  room_id: 1,
  score: Language.get_data(comment),
  created_at: "2021-02-15"
  )
comment = "部屋もサービスも良かったです！また機会があれば行きたいと思います！"
Review.create!(
  star: 5.0,
  comment: comment,
  name: "みかん",
  age: "２０代",
  sex: "女性",
  room_id: 2,
  score: Language.get_data(comment),
  created_at: "2021-02-15"
  )
comment = "チェックインに時間がかかったので星４つにさせていただきました。ですが部屋もフロントの方の対応も丁寧で良かったです。"
Review.create!(
  star: 4.0,
  comment: comment,
  name: "たろう",
  age: "４０代",
  sex: "男性",
  room_id: 1,
  score: Language.get_data(comment),
  created_at: "2021-02-17"
  )
comment = "部屋に埃がありました。残念です。"
Review.create!(
  star: 2.0,
  comment: comment,
  name: "ピカチュウ",
  age: "４０代",
  sex: "女性",
  room_id: 2,
  score: Language.get_data(comment),
  created_at: "2021-02-18"
  )
comment = "家族で利用させていただきました。子供も大満足です。子供がいるとのことで部屋まで荷物を運んでいただき感謝の気持ちでいっぱいです。"
Review.create!(
  star: 5.0,
  comment: comment,
  name: "鈴木",
  age: "４０代",
  sex: "女性",
  room_id: 3,
  score: Language.get_data(comment),
  created_at: "2021-02-20"
  )
comment = "ちょうど混雑している時間帯でチェックインに３０分も待たされました。"
Review.create!(
  star: 1.0,
  comment: comment,
  name: "次郎",
  age: "５０代",
  sex: "男性",
  room_id: 1,
  score: Language.get_data(comment),
  created_at: "2021-02-20"
  )
comment = "３度目の利用で、フロントの方が名前を覚えていてくださったのがとても嬉しかったです。"
Review.create!(
  star: 5.0,
  comment: comment,
  name: "さくら",
  age: "３０代",
  sex: "女性",
  room_id: 2,
  score: Language.get_data(comment),
  created_at: "2021-02-23"
  )
comment = "お洒落な部屋で大満足です！"
Review.create!(
  star: 4.0,
  comment: comment,
  name: "鈴木花子",
  age: "２０代",
  sex: "女性",
  room_id: 2,
  score: Language.get_data(comment),
  created_at: "2021-02-27"
  )
comment = "期待通りお洒落な部屋でした！初めての利用でしたが大満足です！また機会があれば泊まりに行きます^^"
Review.create!(
  star: 4.0,
  comment: comment,
  name: "まり",
  age: "１０代",
  sex: "女性",
  room_id: 1,
  score: Language.get_data(comment),
  created_at: "2021-03-01"
  )
comment = "良かったです"
Review.create!(
  star: 3.0,
  comment: comment,
  name: "サブロウ",
  age: "２０代",
  sex: "男性",
  room_id: 1,
  score: Language.get_data(comment),
  created_at: "2021-03-02"
  )
comment = "従業員の方の親切な対応が良かったです！"
Review.create!(
  star: 5.0,
  comment: comment,
  name: "りんご",
  age: "２０代",
  sex: "女性",
  room_id: 2,
  score: Language.get_data(comment),
  created_at: "2021-03-04"
  )


Notification.create!(
  contact_id: 1,
  action: "お問い合わせ",
  created_at: "2021-02-01"
)
Notification.create!(
  contact_id: 2,
  action: "お問い合わせ",
  created_at: "2021-02-15"
)
Notification.create!(
  review_id: 1,
  action: "レビュー",
  created_at: "2021-02-15"
)
Notification.create!(
  review_id: 2,
  action: "レビュー",
  created_at: "2021-02-15"
)
Notification.create!(
  contact_id: 3,
  action: "お問い合わせ",
  created_at: "2021-02-16"
)
Notification.create!(
  contact_id: 4,
  action: "お問い合わせ",
  created_at: "2021-02-17"
)
Notification.create!(
  contact_id: 5,
  action: "お問い合わせ",
  created_at: "2021-02-17"
)
Notification.create!(
  review_id: 3,
  action: "レビュー",
  created_at: "2021-02-17"
)
Notification.create!(
  review_id: 4,
  action: "レビュー",
  created_at: "2021-02-18"
)
Notification.create!(
  contact_id: 6,
  action: "お問い合わせ",
  created_at: "2021-02-18"
)
Notification.create!(
  contact_id: 7,
  action: "お問い合わせ",
  created_at: "2021-02-19"
)
Notification.create!(
  reservation_id: 1,
  action: "予約",
  created_at: "2021-02-19"
)
Notification.create!(
  reservation_id: 2,
  action: "予約",
  created_at: "2021-02-20"
)
Notification.create!(
  review_id: 5,
  action: "レビュー",
  created_at: "2021-02-20"
)
Notification.create!(
  contact_id: 8,
  action: "お問い合わせ",
  created_at: "2021-02-20"
)
Notification.create!(
  review_id: 6,
  action: "レビュー",
  created_at: "2021-02-20"
)
Notification.create!(
  contact_id: 9,
  action: "お問い合わせ",
  created_at: "2021-02-20"
)
Notification.create!(
  reservation_id: 3,
  action: "予約",
  created_at: "2021-02-20"
)
Notification.create!(
  contact_id: 10,
  action: "お問い合わせ",
  created_at: "2021-02-20"
)
Notification.create!(
  reservation_id: 4,
  action: "予約",
  created_at: "2021-02-21"
)
Notification.create!(
  contact_id: 11,
  action: "お問い合わせ",
  created_at: "2021-02-21"
)
Notification.create!(
  reservation_id: 5,
  action: "予約",
  created_at: "2021-02-23"
)
Notification.create!(
  review_id: 7,
  action: "レビュー",
  created_at: "2021-02-23"
)
Notification.create!(
  review_id: 8,
  action: "レビュー",
  created_at: "2021-02-27"
)
Notification.create!(
  reservation_id: 6,
  action: "予約",
  created_at: "2021-02-28"
)
Notification.create!(
  review_id: 9,
  action: "レビュー",
  created_at: "2021-03-01"
)
Notification.create!(
  review_id: 10,
  action: "レビュー",
  created_at: "2021-03-02"
)
Notification.create!(
  contact_id: 12,
  action: "お問い合わせ",
  created_at: "2021-03-02"
)
Notification.create!(
  reservation_id: 7,
  action: "予約",
  created_at: "2021-03-03"
)
Notification.create!(
  review_id: 11,
  action: "レビュー",
  created_at: "2021-03-04"
)
Notification.create!(
  reservation_id: 8,
  action: "予約",
  created_at: "2021-03-04"
)
Notification.create!(
  reservation_id: 9,
  action: "予約",
  created_at: "2021-03-10"
)
Notification.create!(
  contact_id: 13,
  action: "お問い合わせ",
  created_at: "2021-03-11"
)
Notification.create!(
  reservation_id: 10,
  action: "予約",
  created_at: "2021-03-12"
)
