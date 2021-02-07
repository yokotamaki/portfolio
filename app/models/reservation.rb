class Reservation < ApplicationRecord
  belongs_to :room, optional: true
  belongs_to :guest
end
