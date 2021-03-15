class CustomersController < ApplicationController
  before_action :authenticate_customer!

  def mypage
    customer = Customer.find(params[:id])
    @guest = Guest.where(email: customer.email)
    if customer.id != current_customer.id
      redirect_to new_customer_session_path
    end
  rescue
    redirect_to new_customer_session_path
  end

  def show
    @guest = Guest.find(params[:id])
    @reservation = Reservation.find_by(guest_id: @guest.id)
    customer = Customer.find_by(email: @guest.email)
    if customer.id != current_customer.id
      redirect_to new_customer_session_path
    end
  rescue
    redirect_to new_customer_session_path
  end

  def edit
    @guest = Guest.find(params[:id])
    customer = Customer.find_by(email: @guest.email)
    if customer.id != current_customer.id
      redirect_to new_customer_session_path
    end
  rescue
    redirect_to new_customer_session_path
  end

  def update
    @guest = Guest.find(params[:id])
    if @guest.update(guest_params)
      redirect_to customer_path(@guest)
    else
      render :edit
    end
  end

  private
  def guest_params
    params.require(:guest).permit(:name, :name_kana, :birthday, :sex, :zipcode, :address, :phone_number)
  end
end
