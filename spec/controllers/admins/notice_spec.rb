require 'rails_helper'

RSpec.describe Admin::NoticesController, type: :controller do
  describe "indexアクション" do
    let(:admin) { create(:admin) }
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

  describe "newアクション" do
    let(:admin) { create(:admin) }
    context "ログインしている場合" do
      before do
        sign_in admin
      end
      it "正常なレスポンスである" do
        get :new
        expect(response).to be_success
      end
      it "200レスポンスが返ってくる" do
        get :new
        expect(response).to have_http_status "200"
      end
    end
    context "ログインしていない場合" do
      it "ログイン画面へ遷移する" do
        get :new
        expect(response).to redirect_to "/admins/sign_in"
      end
      it "正常なレスポンスが返ってこない" do
        get :new
         expect(response).to_not be_success
      end
      it "302レスポンスが返ってくる" do
        get :new
        expect(response).to have_http_status "302"
      end
    end
  end
end
