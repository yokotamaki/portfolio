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

  def edit
    @guest = Guest.find(params[:id])

  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update(guest_params)
      redirect_to customer_path(@guest)
    else
      @guest.errors.present?
      render :edit
    end
  end

  private
  def guest_params
    params.require(:guest).permit(:name, :name_kana, :birthday, :sex, :zipcode, :address, :phone_number)
  end
end
