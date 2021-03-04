class Review < ApplicationRecord
  belongs_to :room
  # enum sex: {
  #   男性: 0,
  #   女性: 1
  # }

  # enum age: {
  #   １０代: 0,
  #   ２０代: 1,
  #   ３０代: 2,
  #   ４０代: 3,
  #   ５０代: 4,
  #   ６０代〜: 5
  # }
end
