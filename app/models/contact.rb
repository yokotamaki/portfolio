class Contact < ApplicationRecord
  enum status: {未対応: 0, 対応中: 1, 対応完了: 2,}

  # バリデーションの設定
  validates :title, presence: { message: "タイトルを入力してください" }
  validates :body, presence: { message: "内容を入力してください" }
  validates :name, presence: { message: "名前を入力してください" }
  validates :email, presence: { message: "メールアドレスを入力してください" }

  # 検索機能
  def self.search(keyword)
    @contact = Contact.where(["name LIKE(?) OR title LIKE(?) OR body LIKE(?)", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end
end
