class CustomersController < ApplicationController
  def mypage
    customer = Customer.find(params[:id])
    @guest = Guest.where(email: customer.email)
    @guest.each do |guest|
      @reservation = Reservation.where(guest_id: guest.id)
    end
  end

  def show
    @guest = Guest.find(params[:id])
    @reservation = Reservation.find_by(id: @guest.id)
  end
end
