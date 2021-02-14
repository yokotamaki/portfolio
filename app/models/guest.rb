class Guest < ApplicationRecord
  has_one :reservation, dependent: :destroy

  validates :name, presence: { message: "名前を入力してください" }
  validates :name_kana, presence: { message: "フリガナを入力してください" }
  validates :zipcode, presence: { message: "郵便番号を入力してください" }
  validates :address, presence: { message: "住所を入力してください" }
  validates :phone_number, presence: { message: "電話番号を入力してください" }
  validates :email, presence: { message: "メールアドレスを入力してください" }

  attribute :start_date
  attribute :end_date
  attribute :people
  attribute :room
end
