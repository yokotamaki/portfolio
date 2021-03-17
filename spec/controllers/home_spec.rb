require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  describe "topアクション" do
    it "正常なレスポンスである" do
      get :top
       expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      get :top
      expect(response).to have_http_status "200"
    end
  end

  describe "accessアクション" do
    it "正常なレスポンスである" do
      get :access
       expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      get :access
      expect(response).to have_http_status "200"
    end
  end
end
