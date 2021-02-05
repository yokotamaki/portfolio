class Contact < ApplicationRecord
  enum status: {未対応: 0, 対応中: 1, 対応完了: 2,}
end
