class Admin::ReservationsController < ApplicationController
  def index
    @reservations = Reservation.page(params[:page]).all.per(15)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @guest = @reservation.guest
  end
end

