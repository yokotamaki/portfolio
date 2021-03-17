require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
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

  describe "createアクション" do
    let(:review) { build(:review) }
    before do
      @review_params = { star: review.star,
                        comment: review.comment,
                        name: review.name,
                        age: review.age,
                        sex: review.sex,
                        room_id: review.room_id,
                        score: review.score }
    end
    # it "レビューが保存できる" do
    #   expect do
    #     post :create, params: { review: @review_params }
    #   end.to change(Review, :count).by(1)
    # end
    # it "通知テーブルに保存できる" do
    #   expect do
    #     post :create, params: { review: @review_params }
    #   end.to change(Notification, :count).by(1)
    # end
  end
end