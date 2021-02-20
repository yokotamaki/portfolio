require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe "データを保存するとき" do
    it "保存する時、全ての値がある場合は有効である" do
      reservation = build(:reservation)
      expect(reservation).to be_valid
    end
  end

  describe "バリデーションの設定" do
    it "到着日が過去の日付の場合エラーメッセージがでる" do
      reservation = build(:reservation, start_date: "2020-12-01", end_date: "2020-12-02")
      reservation.valid?
      expect(reservation.errors[:start_date]).to include("過去の日付は選択できません！")
    end
    it "出発日が到着日の翌日でない場合エラーメッセージがでる" do
      reservation = build(:reservation, start_date: "2021-02-20", end_date: "2021-02-22")
      reservation.valid?
      expect(reservation.errors[:end_date]).to include("到着日の翌日しか選択できません！")
    end
  end
end

