class ReservationsController < ApplicationController
  def search
    @reservation = Reservation.new
  end

  def room
    @start_date = Date.parse(reservation_params[:start_date])
    @end_date = Date.parse(reservation_params[:end_date])
    @reservation = Reservation.where(start_date: @start_date...@end_date).group(:room_id)
    @reservation.each do |reservation|
      room_reservation = Reservation.where(start_date: @start_date...@end_date)
                                    .where(room_id: reservation.room.id)
      # 予約されてる部屋の件数 == 実際にある部屋数
      if room_reservation.count == reservation.room.capacity
        reservation.room.reserved.flag = true
      end
    end
    @rooms = Room.all
    @people = (reservation_params[:people]).to_i
    @rooms.each do |room|
      # 選択された人数 > 部屋の定員数
      if @people > room.people
        # room.reserved_flag = true
      end
    end
  end

  def guest
    render :guest and return if params[:back]
    @guest = Guest.new
    @start_date = reservation_params[:start_date]
    @end_date = reservation_params[:end_date]
    @people = reservation_params[:people]
    @room = reservation_params[:room]
  end

  def confirm
    @guest_confirm = Guest.new
    # # 日付・人数・部屋
    @start_date = guest_params[:start_date]
    @end_date = guest_params[:end_date]
    @people = guest_params[:people]
    if guest_params[:room] == "1"
      @room = 1
      @room_name = Room.find(1).name
    elsif guest_params[:room] == "2"
      @room = 2
      @room_name = Room.find(2).name
    elsif guest_params[:room] == "3"
      @room = 3
      @room_name = Room.find(3).name
    end
    # 宿泊者情報
    @name = guest_params[:name]
    @name_kana = guest_params[:name_kana]
    @birthday = Date.new(guest_params["birthday(1i)"].to_i,guest_params["birthday(2i)"].to_i,guest_params["birthday(3i)"].to_i)
    if guest_params[:sex] == "true"
      @sex = "男"
    elsif guest_params[:sex] == "false"
      @sex = "女"
    end
    @zipcode = guest_params[:zipcode]
    @address = guest_params[:address]
    @phone_number = guest_params[:phone_number]
    @email = guest_params[:email]
  end

  def create
    # 戻る際に値を渡す　guest_confirm_paramsだと値がうまく渡らなかった
    @guest = Guest.new(params.require(:guest).permit(:name, :name_kana, :birthday, :sex,:zipcode, :address, :phone_number, :email))
    @start_date = params[:guest][:start_date]
    @end_date = params[:guest][:end_date]
    @people = params[:guest][:people]
    @room = params[:guest][:room]
    render :guest and return if params[:back]

    # 各モデルに保存
    guest = Guest.new({
    name: guest_params[:name],
    name_kana: guest_params[:name_kana],
    birthday: guest_params[:birthday],
    sex: guest_params[:sex],
    zipcode: guest_params[:zipcode],
    address: guest_params[:address],
    phone_number: guest_params[:phone_number],
    email: guest_params[:email]
    })
    guest.save
    reservation = Reservation.new({
      start_date: guest_params[:start_date],
      end_date: guest_params[:end_date],
      people: guest_params[:people],
      room_id: guest_params[:room],
      guest_id: guest.id
    })
    reservation.save
    redirect_to success_reservations_path
  end

  def success
  end

  private
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people, :room)
  end
  def guest_confirm_params
    params.permit(:name, :name_kana, :birthday, :sex,
                                  :zipcode, :address, :phone_number, :email,
                                  :start_date, :end_date, :people, :room, :back)
  end
  def guest_params
    params.require(:guest).permit(:name, :name_kana, :birthday, :sex,
                                  :zipcode, :address, :phone_number, :email,
                                  :start_date, :end_date, :people, :room, :back)
  end
end


# people: guest_params[:people]
# people: params[:guest][:people]

