class Reservation < ApplicationRecord
  belongs_to :room
  belongs_to :guest
  has_one :notification
  belongs_to :customer, optional: true

  # start_dateに対するバリデーション
  validate :not_before_today
  # end_dateに対するバリデーション
  validate :not_before_start_date

  def not_before_today
    if start_date.nil? || start_date < Date.today
      errors.add(:start_date, '過去の日付は選択できません！')
    end
  end

  def not_before_start_date
    if end_date.nil? || end_date != start_date + 1
      errors.add(:end_date, '到着日の翌日しか選択できません！')
    end
  end

  # 検索機能
  def self.search(keyword)
      @reservation = Reservation.joins(:room).joins(:guest)
                                .select("reservations.*, guests.name, rooms.name")
                                .where(["rooms.name LIKE ? OR guests.name LIKE ?", "%#{keyword}%", "%#{keyword}%"])
  end
end
