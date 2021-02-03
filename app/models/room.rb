class Room < ApplicationRecord
  has_many :reservations
  has_one_attached :image
end
