require 'rails_helper'

RSpec.describe Admin::NotificationsController, type: :controller do
  describe "indexアクション" do
    let(:admin) { create(:admin) }
    let(:guest) { create(:guest) }
    let(:reservation) { create(:reservation, guest_id: guest.id, start_date: Date.today, end_date: Date.tomorrow) }
    let(:notification) { create(:notification, reservation_id: reservation.id, action: "予約" ) }
    context "ログインしている場合" do
      before do
        sign_in admin
      end
      it "正常なレスポンスである" do
        get :index
        expect(response).to be_success
      end
      it "200レスポンスが返ってくる" do
        get :index
        expect(response).to have_http_status "200"
      end
      it "リンクをクリックすると正常に詳細ページへ遷移する" do
        get :index, params: { id: notification.id }
        expect(response).to have_http_status "200"
      end
      it "絞り込み結果が正常に返ってくる" do
        get :index, params: { notification_search: {action: notification.action}}
        expect(response).to have_http_status "200"
      end
    end
    context "ログインしていない場合" do
      it "ログイン画面へ遷移する" do
        get :index
        expect(response).to redirect_to "/admins/sign_in"
      end
      it "正常なレスポンスが返ってこない" do
        get :index
         expect(response).to_not be_success
      end
      it "302レスポンスが返ってくる" do
        get :index
        expect(response).to have_http_status "302"
      end
    end
  end
end