require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  describe "searchアクション" do
    it "正常なレスポンスである" do
      get :search
       expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      get :search
      expect(response).to have_http_status "200"
    end
    it "日付が空の場合は遷移されない" do
      reservation_params = { start_data: nil, end_data: nil }
      put :search, params: { reservation: reservation_params }
      expect(response).to render_template(:search)
    end
  end

  describe "guestアクション" do
    let(:room) { create(:room) }
    let(:reservation) { Reservation.new(room_id: room.id, start_date: Date.today, end_date: Date.tomorrow, people: 2) }
    before do
      @reservation_params = {room_id: room.id,
                                          start_date: reservation.start_date,
                                          end_date: reservation.end_date,
                                          people: reservation.people}
    end
    it "正常なレスポンスである" do
      post :guest, params: { reservation: @reservation_params }
      expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      post :guest, params: { reservation: @reservation_params }
      expect(response).to have_http_status "200"
    end
  end

  describe "confirmアクション" do
    let(:room) { create(:room) }
    let(:guest) { build(:guest) }
    let(:reservation) { build(:reservation, room_id: room.id, people: 2, start_date: Date.today, end_date: Date.tomorrow) }
    before do
      @guest_params = {room_id: room.id,
                      start_date: reservation.start_date,
                      end_date: reservation.end_date,
                      people: reservation.people,
                      name: guest.name,
                      name_kana: guest.name_kana,
                      birthday: guest.birthday,
                      sex: guest.sex,
                      zipcode: guest.zipcode,
                      address: guest.address,
                      phone_number: guest.phone_number,
                      email: guest.email}
    end
    it "正常なレスポンスである" do
      post :confirm, params: { guest: @guest_params }
      expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      post :confirm, params: { guest: @guest_params }
      expect(response).to have_http_status "200"
    end
  end

  describe "createアクション" do
    let(:room) { create(:room) }
    let(:guest) { build(:guest) }
    let(:reservation) { build(:reservation, room_id: room.id, people: 2, start_date: Date.today, end_date: Date.tomorrow) }
    before do
      @guest_params = {room_id: room.id,
                      start_date: reservation.start_date,
                      end_date: reservation.end_date,
                      people: reservation.people,
                      name: guest.name,
                      name_kana: guest.name_kana,
                      birthday: guest.birthday,
                      sex: guest.sex,
                      zipcode: guest.zipcode,
                      address: guest.address,
                      phone_number: guest.phone_number,
                      email: guest.email}
    end
    it "ゲスト情報を保存できる" do
      expect do
        post :create, params: { guest: @guest_params }
      end.to change(Guest, :count).by(1)
    end
    it "予約情報を保存できる" do
      expect do
        post :create, params: { guest: @guest_params }
      end.to change(Reservation, :count).by(1)
    end
    it "ゲスト情報と予約情報を通知テーブルに保存できる" do
      expect do
        post :create, params: { guest: @guest_params }
      end.to change(Notification, :count).by(1)
    end
  end

  describe "successアクション" do
    it "正常なレスポンスである" do
      get :success
       expect(response).to be_success
    end
    it "200レスポンスが返ってくる" do
      get :success
      expect(response).to have_http_status "200"
    end
  end
end
