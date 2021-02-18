class Guest < ApplicationRecord
  has_one :reservation, dependent: :destroy

  # バリデーションの設定
  validates :name, presence: { message: "名前を入力してください" },
                   length: { in: 2..10 , message: "名前は２文字以上で入力してください"}
  validates :name_kana, presence: { message: "フリガナを入力してください" },
                        format: { with: /\p{katakana}/ , message: "フリガナは全角カタカナで入力してください"}
  validates :birthday, presence: { message: "生年月日を選択してください" }
  validates :zipcode, presence: { message: "郵便番号を入力してください" },
                      format: { with: /\A\d{7}\z/, message: "郵便番号は７桁で入力してください (ハイフンなし)"}
  validates :address, presence: { message: "住所を入力してください" }
  validates :phone_number, presence: { message: "電話番号を入力してください" }
  validates :email, presence: { message: "メールアドレスを入力してください" }


  attribute :start_date
  attribute :end_date
  attribute :people
  attribute :room
end
