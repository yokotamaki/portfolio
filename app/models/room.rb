class Room < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :reviews
  has_one_attached :image
end
