require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe "newアクション" do
    it "正常なレスポンスである" do
      get :new
       expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      get :new
      expect(response).to have_http_status "200"
    end
  end

  describe "confirmアクション" do
    let(:contact) { build(:contact) }
    before do
      @contact_params = { title: contact.title,
                        body: contact.body,
                        name: contact.name,
                        email: contact.email}
    end
    it "正常なレスポンスである" do
      post :confirm, params: { contact: @contact_params }
       expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      post :confirm, params: { contact: @contact_params }
      expect(response).to have_http_status "200"
    end
  end

  describe "createアクション" do
    let(:contact) { build(:contact) }
    before do
      @contact_params = { title: contact.title,
                        body: contact.body,
                        name: contact.name,
                        email: contact.email}
    end
    it "お問い合わせを保存できる" do
      expect do
        post :create, params: { contact: @contact_params }
      end.to change(Contact, :count).by(1)
    end
    it "通知テーブルに保存できる" do
      expect do
        post :create, params: { contact: @contact_params }
      end.to change(Notification, :count).by(1)
    end
  end

  describe "successアクション" do
    it "正常なレスポンスである" do
      post :success
       expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      post :success
      expect(response).to have_http_status "200"
    end
  end
end
