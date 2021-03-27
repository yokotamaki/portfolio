require 'rails_helper'

RSpec.describe NoticesController, type: :controller do
  describe "indexアクション" do
    it "正常なレスポンスである" do
      get :index
      expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "showアクション" do
    let(:notice) { create(:notice) }
    it "正常なレスポンスである" do
      get :show, params: { id: notice.id}
      expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      get :show,  params: { id: notice.id}
      expect(response).to have_http_status "200"
    end
  end
end
