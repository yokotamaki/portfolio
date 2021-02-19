require 'rails_helper'

RSpec.describe "contact" do
  describe "データを保存するとき" do
    it "保存する時、全ての値がある場合は有効である" do
      contact = build(:contact)
      expect(contact).to be_valid
    end
  end

  describe "バリデーションの設定" do
    it "タイトルが空の場合エラーメッセージがでる" do
      contact = build(:contact, title: "")
      contact.valid?
      expect(contact.errors[:title]).to include("タイトルを入力してください")
    end
    it "内容が空の場合エラーメッセージがでる" do
      contact = build(:contact, body: "")
      contact.valid?
      expect(contact.errors[:body]).to include("内容を入力してください")
    end
    it "名前が空の場合エラーメッセージがでる" do
      contact = build(:contact, name: "")
      contact.valid?
      expect(contact.errors[:name]).to include("名前を入力してください")
    end
    it "メールアドレスが空の場合エラーメッセージがでる" do
      contact = build(:contact, email: "")
      contact.valid?
      expect(contact.errors[:email]).to include("メールアドレスを入力してください")
    end
  end
end

