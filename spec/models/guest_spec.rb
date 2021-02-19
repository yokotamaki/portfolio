require 'rails_helper'

RSpec.describe "guest" do
  describe "データを保存するとき" do
    it "保存する時、全ての値がある場合は有効である" do
      guest = build(:guest)
      expect(guest).to be_valid
    end
  end

  describe "バリデーションの設定" do
    it "名前が空の場合エラーメッセージがでる" do
      guest = build(:guest, name: "")
      guest.valid?
      expect(guest.errors[:name]).to include("名前を入力してください")
    end
    it "名前が２文字以上１０文字以内ではない場合エラーメッセージがでる" do
      guest = build(:guest, name: "山")
      guest.valid?
      expect(guest.errors[:name]).to include("名前は２文字以上で入力してください")
    end
    it "フリガナが空の場合エラーメッセージがでる" do
      guest = build(:guest, name_kana: "")
      guest.valid?
      expect(guest.errors[:name_kana]).to include("フリガナを入力してください")
    end
    it "フリガナが全角カタカナでない場合エラーメッセージがでる" do
      guest = build(:guest, name_kana: "やまだ　たろう")
      guest.valid?
      expect(guest.errors[:name_kana]).to include("フリガナは全角カタカナで入力してください")
    end
    it "生年月日が空の場合エラーメッセージがでる" do
      guest = build(:guest, birthday: "")
      guest.valid?
      expect(guest.errors[:birthday]).to include("生年月日を選択してください")
    end
    it "郵便番号が空の場合エラーメッセージがでる" do
      guest = build(:guest, zipcode: "")
      guest.valid?
      expect(guest.errors[:zipcode]).to include("郵便番号を入力してください")
    end
    it "郵便番号が７桁でない場合エラーメッセージがでる" do
      guest = build(:guest, zipcode: "111111")
      guest.valid?
      expect(guest.errors[:zipcode]).to include("郵便番号は７桁で入力してください (ハイフンなし)")
    end
    it "住所が空の場合エラーメッセージがでる" do
      guest = build(:guest, address: "")
      guest.valid?
      expect(guest.errors[:address]).to include("住所を入力してください")
    end
    it "電話番号が空の場合エラーメッセージがでる" do
      guest = build(:guest, phone_number: "")
      guest.valid?
      expect(guest.errors[:phone_number]).to include("電話番号を入力してください")
    end
    it "メールアドレスが空の場合エラーメッセージがでる" do
      guest = build(:guest, email: "")
      guest.valid?
      expect(guest.errors[:email]).to include("メールアドレスを入力してください")
    end
  end
end

