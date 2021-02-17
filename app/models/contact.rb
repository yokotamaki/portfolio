class Contact < ApplicationRecord
  enum status: {未対応: 0, 対応中: 1, 対応完了: 2,}

  # 検索機能
  def self.search(keyword)
    @contact = Contact.where(["name LIKE(?) OR title LIKE(?) OR body LIKE(?)", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end
end
