require 'rails_helper'

RSpec.describe Admin::ContactsController, type: :controller do
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

  describe "showアクション" do
    let(:admin) { create(:admin) }
    let(:contact) { create(:contact) }
    context "ログインしている場合" do
      before do
        sign_in admin
      end
      it "正常なレスポンスである" do
        get :show, params: { id: contact.id }
        expect(response).to be_success
      end
      it "200レスポンスが返ってくる" do
        get :show, params: { id: contact.id }
        expect(response).to have_http_status "200"
      end
    end
    context "ログインしていない場合" do
      it "ログイン画面へ遷移する" do
        get :show, params: { id: contact.id }
        expect(response).to redirect_to "/admins/sign_in"
      end
      it "正常なレスポンスが返ってこない" do
        get :show, params: { id: contact.id }
         expect(response).to_not be_success
      end
      it "302レスポンスが返ってくる" do
        get :show, params: { id: contact.id }
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "updateアクション" do
    let(:admin) { create(:admin) }
    let!(:contact) { create(:contact) }
    context "ログインしている場合" do
      before do
        sign_in admin
      end
      # it "正常に更新できる" do
      #   put :update, params: { id: contact.id, contact: { status: "対応中"} }
      #   expect(contact.reload.status).to eq "対応中"
      # end
      # it "更新後詳細ページへ遷移する" do
      #   put :update, params: { id: contact.id, contact: { status: "対応中"} }
      #   expect(response).to redirect_to "/admin/contacts/#{contact.id}"
      # end
    end
  end
end
