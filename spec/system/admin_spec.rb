require 'rails_helper'

RSpec.describe "管理者側のテスト", type: :system do

  # describe "ヘッダー(ログイン後)" do
  #   before do
  #     visit new_admin_session_path
  #     fill_in "admin[email]", with: "admin@admin"
  #     fill_in "admin[password]", with: "aaaaaa"
  #     click_button "ログイン"
  #   end
  #   it "ログイン後は予約一覧画面に遷移される" do
  #     expect(current_path).to eq "/admin/reservations"
  #   end
  #   context "ヘッダーの遷移先の確認" do
  #     it "予約一覧のリンク内容が正しい" do
  #       expect(current_path).to have_link "", href: admin_reservations_path
  #     end
  #     it "お問い合わせ一覧のリンク内容が正しい" do
  #       expect(current_path).to have_link "", href: admin_contacts_path
  #     end
  #   end
  # end



  describe "予約一覧" do
    context "表示の確認（indexアクション）" do
      before do
        visit admin_reservations_path
      end
      it "URLが正しい" do
        expect(current_path).to eq "/admin/reservations"
      end
      it "予約一覧画面が表示される" do
        expect(page).to have_content "予約一覧"
      end
    end
  end

end


#     context "表示の確認（successアクション）" do
#       before do
#         visit success_reservations_path
#       end
#       it "URLが正しい" do
#         expect(current_path).to eq "/reservations/success"
#       end
#       it "予約完了画面が表示される" do
#         expect(page).to have_content "予約が完了しました"
#       end
#     end
#   end


#   describe "お問い合わせ" do
#     context "表示の確認（newアクション）" do
#       before do
#         visit new_contact_path
#       end
#       it "URLが正しい" do
#         expect(current_path).to eq "/contacts/new"
#       end
#       it "お問い合わせ画面が表示される" do
#         expect(page).to have_content "お問い合わせ"
#       end
#       it "タイトルの入力フォームが表示される" do
#         expect(page).to have_field "contact[title]"
#       end
#       it "内容の入力フォームが表示される" do
#         expect(page).to have_field "contact[body]"
#       end
#       it "名前の入力フォームが表示される" do
#         expect(page).to have_field "contact[name]"
#       end
#       it "メールアドレスの入力フォームが表示される" do
#         expect(page).to have_field "contact[email]"
#       end
#       it "送信ボタンが表示される" do
#         expect(page).to have_button "送信"
#       end
#       it "タイトルが空の場合エラーメッセージが表示される" do
#         fill_in "contact[title]", with: nil
#         fill_in "contact[body]", with: "テスト"
#         fill_in "contact[name]", with: "テスト"
#         fill_in "contact[email]", with: "test@test"
#         click_button "送信"
#         expect(page).to have_content "タイトルを入力してください"
#       end
#       it "内容が空の場合エラーメッセージが表示される" do
#         fill_in "contact[title]", with: "テスト"
#         fill_in "contact[body]", with: nil
#         fill_in "contact[name]", with: "テスト"
#         fill_in "contact[email]", with: "test@test"
#         click_button "送信"
#         expect(page).to have_content "内容を入力してください"
#       end
#       it "名前が空の場合エラーメッセージが表示される" do
#         fill_in "contact[title]", with: "テスト"
#         fill_in "contact[body]", with: "テスト"
#         fill_in "contact[name]", with: nil
#         fill_in "contact[email]", with: "test@test"
#         click_button "送信"
#         expect(page).to have_content "名前を入力してください"
#       end
#       it "メールアドレスが空の場合エラーメッセージが表示される" do
#         fill_in "contact[title]", with: "テスト"
#         fill_in "contact[body]", with: "テスト"
#         fill_in "contact[name]", with: "テスト"
#         fill_in "contact[email]", with: nil
#         click_button "送信"
#         expect(page).to have_content "メールアドレスを入力してください"
#       end
#     end

#     context "表示の確認（successアクション）" do
#       before do
#         visit success_contacts_path
#       end
#       it "URLが正しい" do
#         expect(current_path).to eq "/contacts/success"
#       end
#       it "お問い合わせ完了画面が表示される" do
#         expect(page).to have_content "お問い合わせ完了"
#       end
#     end
#   end


#   describe "アクセス" do
#     context "表示の確認" do
#       before do
#         visit access_path
#       end
#       it "URLが正しい" do
#         expect(current_path).to eq "/access"
#       end
#       it "アクセス画面が表示される" do
#         expect(page).to have_content "アクセス"
#       end
#     end
#   end

# end