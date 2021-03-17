require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe "mypageアクション" do
    let(:customer) { create(:customer) }
    let!(:guest) { create(:guest) }
    context "ログインしている場合" do
      before do
        sign_in customer
      end
      it "正常なレスポンスである" do
        get :mypage, params: { id: customer.id }
         expect(response).to be_success
      end
      it "200レスポンスが返ってくる" do
        get :mypage, params: { id: customer.id }
        expect(response).to have_http_status "200"
      end
    end
    context "ログインしていない場合" do
      it "ログイン画面へ遷移する" do
        get :mypage, params: { id: customer.id }
        expect(response).to redirect_to "/customers/sign_in"
      end
      it "正常なレスポンスが返ってこない" do
        get :mypage, params: { id: customer.id }
        expect(response).to_not be_success
      end
      it "302レスポンスが返ってくる" do
        get :mypage, params: { id: customer.id }
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "showアクション" do
    let(:guest) { create(:guest) }
    let!(:reservation) { create(:reservation, guest_id: guest.id, start_date: Date.today, end_date: Date.tomorrow) }
    let(:customer) { create(:customer) }
    before do
      @c = Customer.find(customer.id)
      @guest = Guest.find_by(email: @c.email)
    end
    context "ログインしている場合" do
      before do
        sign_in @c
      end
      it "正常なレスポンスである" do
        get :show, params: { id: @guest.id }
        expect(response).to be_success
      end
      it "200レスポンスが返ってくる" do
        get :show, params: { id: @guest.id }
        expect(response).to have_http_status "200"
      end
    end
    context "ログインしていない場合" do
      it "ログイン画面へ遷移する" do
        get :show, params: { id: @guest.id }
        expect(response).to redirect_to "/customers/sign_in"
      end
      it "正常なレスポンスが返ってこない" do
        get :show, params: { id: @guest.id }
        expect(response).to_not be_success
      end
      it "302レスポンスが返ってくる" do
        get :show, params: { id: @guest.id }
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "editアクション" do
    let(:guest) { create(:guest) }
    let!(:reservation) { create(:reservation, guest_id: guest.id, start_date: Date.today, end_date: Date.tomorrow) }
    let(:customer) { create(:customer) }
    before do
      @c = Customer.find(customer.id)
      @guest = Guest.find_by(email: @c.email)
      end
    context "ログインしている場合" do
      before do
        sign_in @c
      end
      it "正常なレスポンスである" do
        get :edit, params: { id: @guest.id }
        expect(response).to be_success
      end
      it "200レスポンスが返ってくる" do
        get :edit, params: { id: @guest.id }
        expect(response).to have_http_status "200"
      end
    end
    context "ログインしていない場合" do
      it "ログイン画面へ遷移する" do
        get :edit, params: { id: @guest.id }
        expect(response).to redirect_to "/customers/sign_in"
      end
      it "正常なレスポンスが返ってこない" do
        get :edit, params: { id: @guest.id }
        expect(response).to_not be_success
      end
      it "302レスポンスが返ってくる" do
        get :edit, params: { id: @guest.id }
        expect(response).to have_http_status "302"
      end
    end
  end

  describe "updateアクション" do
    let(:guest) { create(:guest) }
    let!(:reservation) { create(:reservation, guest_id: guest.id, start_date: Date.today, end_date: Date.tomorrow) }
    let(:customer) { create(:customer) }
    before do
      @c = Customer.find(customer.id)
      @guest = Guest.find_by(email: @c.email)
    end
    context "ログインしている場合" do
      before do
        sign_in @c
      end
      it "正常に更新できる" do
        guest_params = { name: "山田　次郎" }
        put :updatcone, params: { id: @guest.id, guest: guest_params }
        expect(@guest.reload.name).to eq "山田　次郎"
      end
      it "更新後詳細ページへ遷移する" do
        guest_params = { name: "山田　次郎" }
        put :update, params: { id: @guest.id, guest: guest_params }
        expect(response).to redirect_to "/customers/#{@guest.id}"
      end
      it "値が空の場合は更新できない、かつ遷移されない" do
        guest_params = { name: nil }
        put :update, params: { id: @guest.id, guest: guest_params }
        expect(response).to render_template(:edit)
      end
    end
  end
end