class Review < ApplicationRecord
  belongs_to :room
  enum sex: {
    指定なし: 0,
    男性: 1,
    女性: 2
  }

  enum age: {
    １０代: 0,
    ２０代: 1,
    ３０代: 2,
    ４０代: 3,
    ５０代: 4,
    ６０代〜: 5
  }
end
