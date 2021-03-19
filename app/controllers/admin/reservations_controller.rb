class Admin::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  helper_method :sort_column, :sort_direction

  def index
    @reservations = Reservation.joins(:room).joins(:guest).select("reservations.*, guests.name AS guest_name,rooms.name AS room_name")
                               .order("#{sort_column} #{sort_direction}").page(params[:page]).per(15)
  end

  def show
    @reservation = Reservation.find(params[:id])
    @guest = @reservation.guest
  rescue
    redirect_to admin_reservations_path
  end

  def update
    @reservation = Reservation.find(params[:id])
    if @reservation.is_flag == true
      @reservation.update(is_flag: false)
    elsif @reservation.is_flag == false
      @reservation.update(is_flag: true)
    end
  end

  private

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sort_column
    column = Reservation.joins(:room).joins(:guest)
                        .select("reservations.*, guests.name AS guest_name, rooms.name AS room_name").first
    column.attributes.keys.include?(params[:sort]) ? params[:sort] : "id"
  end
end


