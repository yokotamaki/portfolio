class ReservationsController < ApplicationController
  def search
    @reservation = Reservation.new
  end

  def room
    @start_date = Date.parse(reservation_params[:start_date])
    @end_date = Date.parse(reservation_params[:end_date])

    # 日付の選択バリデーション(非同期)
    @reservation = Reservation.new(start_date: @start_date, end_date: @end_date)
    @reservation.valid?
    if @reservation.errors.key?(:start_date) || @reservation.errors.key?(:end_date)
      return render "date_errors"
    end

    # 同じroom_idが複数あっても1つにまとめる（room_idごとに）
    reservations = Reservation.where(start_date: @start_date...@end_date).group(:room_id)

    not_available_room_ids = []
    reservations.each do |reservation|
      # @reservationには1つのroom_idしかないため、room_idをもとにレコードを抽出
      room_reservation = Reservation.where(start_date: @start_date...@end_date)
                                    .where(room_id: reservation.room.id)
      # 予約されてる部屋の件数 == 実際にある部屋数
      if room_reservation.count == reservation.room.capacity
        # 予約不可の部屋のID　<< 予約できない部屋のIDを配列に追加
        not_available_room_ids << reservation.room.id
      end
    end

    @people = (reservation_params[:people]).to_i
    room_all = Room.all
    room_all.each do |room|
      # 選択された人数 > 部屋の定員数
      if @people > room.people
        not_available_room_ids << room.id
        # room.reserved_flag = true
      end
    end

    # .notで予約不可の部屋のID以外を＠roomsに代入
    @rooms = Room.where.not(id: not_available_room_ids)
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
    # 情報入力 バリデーションの設定
    @guest = Guest.new(guest_params)
    @guest.valid?
    if @guest.errors.present?
      @start_date = guest_params[:start_date]
      @end_date = guest_params[:end_date]
      @people = guest_params[:people]
      @room = guest_params[:room]
      return render 'guest'
    end

    # @guestだと戻ったときに空になってしまうため別のインスタンスを用意
    @guest_confirm = Guest.new

    # 日付・人数・部屋
    @start_date = guest_params[:start_date]
    @end_date = guest_params[:end_date]
    @people = guest_params[:people]
    @room = guest_params[:room].to_i
    @room_name = Room.find(guest_params[:room]).name

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
    # 戻るときに値を渡すため
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
    # guest.saveしないとguest.idが決まらないため先に保存する
    if reservation.save!
      NotificationMailer.success_mail(guest).deliver_now
      redirect_to success_reservations_path
      # 管理者へ通知
      notification = Notification.new(
        reservation_id: reservation.id,
        action: "予約"
      )
      notification.save
    end
  end

  def success
  end

  def update
    # 予約詳細（ユーザ）フラグ切り替え
    @reservation = Reservation.find(params[:id])
    if @reservation.is_flag == true
      @reservation.update(is_flag: false)
    elsif @reservation.is_flag == false
      @reservation.update(is_flag: true)
    end
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
