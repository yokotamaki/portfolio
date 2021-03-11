class Notification < ApplicationRecord
  belongs_to :reservation, optional: true
  belongs_to :contact, optional: true

  # 時間（何分前）
  def time
    if (Time.now - self.created_at) <= 60 * 60
      # 60分以内
      ((Time.now - self.created_at) / 60).to_i.to_s + "分前"
    elsif (Time.now - self.created_at) <= 60 * 60 * 24
      # 24時間以内
      ((Time.now - self.created_at) / 3600).to_i.to_s + "時間前"
    elsif (Date.today - self.created_at.to_date) <= 30
      # 30日以内
      (Date.today - self.created_at.to_date).to_i.to_s + "日前"
    else
      # それ以降
      self.created_at.strftime("%Y年%-m月%-d日 %-H時%-M分")
    end
  end
end
