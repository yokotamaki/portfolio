require 'rails_helper'

RSpec.describe "HP側（ユーザ側）のテスト", type: :system do

  describe "トップページ" do
    before do
      visit root_path
    end
    context "ナビゲーションの遷移先の確認" do
      it "hotel(ロゴ)のリンク内容が正しい" do
        expect(page).to have_link "", href: root_path
      end
      it "roomのリンク内容が正しい" do
        expect(page).to have_link "", href: rooms_path
      end
      it "reservationのリンク内容が正しい" do
        expect(page).to have_link "", href: search_reservations_path
      end
      it "accessのリンク内容が正しいる" do
        expect(page).to have_link "", href: access_path
      end
      it "contactのリンク内容が正しい" do
        expect(page).to have_link "", href: new_contact_path
      end
    end
  end


  describe "予約" do
    context "表示の確認（searchアクション）" do
      before do
        visit search_reservations_path
      end
      it "URLが正しい" do
        expect(current_path).to eq "/reservations/search"
      end
      it "到着日の入力フォームが表示される" do
        expect(page).to have_field "reservation[start_date]"
      end
      it "出発日の入力フォームが表示される" do
        expect(page).to have_field "reservation[end_date]"
      end
      it "人数の入力フォームが表示される" do
        expect(page).to have_field "reservation[people]"
      end
      it "検索ボタンが表示される" do
        expect(page).to have_button "検索"
      end
    end

    context "表示の確認（successアクション）" do
      before do
        visit success_reservations_path
      end
      it "URLが正しい" do
        expect(current_path).to eq "/reservations/success"
      end
      it "予約完了画面が表示される" do
        expect(page).to have_content "予約が完了しました"
      end
    end
  end


  describe "レビュー" do
    context "表示の確認(indexアクション)" do
      before do
        visit reviews_path
      end
      it "URLが正しい" do
        expect(current_path).to eq "/reviews"
      end
      it "レビュー一覧画面が表示される" do
        expect(page).to have_content "レビュー"
      end
      it "すべて選択のチェックボックスが表示される" do
        expect(page).to have_field("すべて選択")
      end
      it "部屋タイプのチェックボックスが表示される" do
        expect(page).to have_field("type1")
        expect(page).to have_field("type2")
        expect(page).to have_field("type3")
      end
      it "評価（星）のチェックボックスが表示される" do
        expect(page).to have_field("星１")
        expect(page).to have_field("星２")
        expect(page).to have_field("星３")
        expect(page).to have_field("星４")
        expect(page).to have_field("星５")
      end
      it "年代のチェックボックスが表示される" do
        expect(page).to have_field("１０代")
        expect(page).to have_field("２０代")
        expect(page).to have_field("３０代")
        expect(page).to have_field("４０代")
        expect(page).to have_field("５０代")
        # expect(page).to have_field("６０代〜")
      end
      it "性別のチェックボックスが表示される" do
        expect(page).to have_field("男性")
        expect(page).to have_field("女性")
      end
      it "検索ボタンが表示される" do
        expect(page).to have_button "検索"
      end
    end
  end


  describe "お問い合わせ" do
    context "表示の確認（newアクション）" do
      before do
        visit new_contact_path
      end
      it "URLが正しい" do
        expect(current_path).to eq "/contacts/new"
      end
      it "お問い合わせ画面が表示される" do
        expect(page).to have_content "お問い合わせ"
      end
      it "タイトルの入力フォームが表示される" do
        expect(page).to have_field "contact[title]"
      end
      it "タイトルの入力フォームに値が入っていない" do
        expect(find_field('contact[title]').text).to be_blank
      end
      it "内容の入力フォームが表示される" do
        expect(page).to have_field "contact[body]"
      end
      it "内容の入力フォームに値が入っていない" do
        expect(find_field('contact[body]').text).to be_blank
      end
      it "名前の入力フォームが表示される" do
        expect(page).to have_field "contact[name]"
      end
      it "名前の入力フォームに値が入っていない" do
        expect(find_field('contact[name]').text).to be_blank
      end
      it "メールアドレスの入力フォームが表示される" do
        expect(page).to have_field "contact[email]"
      end
      it "メールアドレスの入力フォームに値が入っていない" do
        expect(find_field('contact[email]').text).to be_blank
      end
      it "送信ボタンが表示される" do
        expect(page).to have_button "送信"
      end
      it "タイトルが空の場合エラーメッセージが表示される" do
        fill_in "contact[title]", with: nil
        fill_in "contact[body]", with: "テスト"
        fill_in "contact[name]", with: "テスト"
        fill_in "contact[email]", with: "test@test"
        click_button "送信"
        expect(page).to have_content "タイトルを入力してください"
      end
      it "内容が空の場合エラーメッセージが表示される" do
        fill_in "contact[title]", with: "テスト"
        fill_in "contact[body]", with: nil
        fill_in "contact[name]", with: "テスト"
        fill_in "contact[email]", with: "test@test"
        click_button "送信"
        expect(page).to have_content "内容を入力してください"
      end
      it "名前が空の場合エラーメッセージが表示される" do
        fill_in "contact[title]", with: "テスト"
        fill_in "contact[body]", with: "テスト"
        fill_in "contact[name]", with: nil
        fill_in "contact[email]", with: "test@test"
        click_button "送信"
        expect(page).to have_content "名前を入力してください"
      end
      it "メールアドレスが空の場合エラーメッセージが表示される" do
        fill_in "contact[title]", with: "テスト"
        fill_in "contact[body]", with: "テスト"
        fill_in "contact[name]", with: "テスト"
        fill_in "contact[email]", with: nil
        click_button "送信"
        expect(page).to have_content "メールアドレスを入力してください"
      end
    end

    context "表示の確認（confirmアクション）" do
      before do
        visit new_contact_path
        fill_in "contact[title]", with: "テスト"
        fill_in "contact[body]", with: "テスト"
        fill_in "contact[name]", with: "テスト"
        fill_in "contact[email]", with: "test@test"
        click_button "送信"
      end
      # it "URLが正しい" do
      #   expect(page).to eq "/contacts/confirm"
      # end
      it "お問い合わせ確認画面が表示される" do
        expect(page).to have_content "お問い合わせ確認"
      end
    end

    context "表示の確認（successアクション）" do
      before do
        visit success_contacts_path
      end
      it "URLが正しい" do
        expect(current_path).to eq "/contacts/success"
      end
      it "お問い合わせ完了画面が表示される" do
        expect(page).to have_content "お問い合わせ完了"
      end
    end
  end


  describe "アクセス" do
    context "表示の確認" do
      before do
        visit access_path
      end
      it "URLが正しい" do
        expect(current_path).to eq "/access"
      end
      it "アクセス画面が表示される" do
        expect(page).to have_content "アクセス"
      end
    end
  end

end