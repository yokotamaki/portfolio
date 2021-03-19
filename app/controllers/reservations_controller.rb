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

    # 同じroom_idが複数あっても1つにまとまる
    reservations = Reservation.where(start_date: @start_date...@end_date).group(:room_id)

    not_available_room_ids = []
    reservations.each do |reservation|
      # @reservationにはroom_idしかないため、room_idをもとにレコードを抽出
      room_reservation = Reservation.where(start_date: @start_date...@end_date)
                                    .where(room_id: reservation.room.id)
      # 予約されてる部屋の件数 == 実際にある部屋数
      if room_reservation.count == reservation.room.capacity
        # 予約不可の部屋のID　<< 予約できない部屋のIDを配列に追加
        not_available_room_ids << reservation.room.id
      end
    end

    @people = reservation_params[:people].to_i
    room_all = Room.all
    room_all.each do |room|
      # 選択された人数 > 部屋の定員数
      if @people > room.people
        not_available_room_ids << room.id
      end
    end

    # .notで予約不可の部屋のID以外を＠roomsに代入
    @rooms = Room.where.not(id: not_available_room_ids)
  end

  def guest
    render(:guest) && return if params[:back]
    @guest = Guest.new
    @reservation = Reservation.new(reservation_params)
  end

  def confirm
    # @guestだと戻ったときに値が空になってしまうため別のインスタンスを用意
    @guest_confirm = Guest.new
    # birthdayのparamsは年月日別れて飛んでくるが.newをすることによって自動的に変更してくれる
    @guest = Guest.new(guest_params)
    # guest_paramsからreservationのデータだけ取り出す
    @reservation = Reservation.new(extract_reservation_params(guest_params))
    @room_name = Room.find(guest_params[:room_id]).name

    # 情報入力 バリデーションの設定
    @guest.valid?
    if @guest.errors.present?
      return render "guest"
    end
  end

  def create
    # 戻るときに値を渡すため
    @guest = Guest.new(extract_guest_params(guest_params))
    @reservation = Reservation.new(extract_reservation_params(guest_params))
    render(:guest) && return if params[:back]

    # 各モデルに保存
    guest = Guest.new(guest_params)
    guest.save
    # 先にguest.saveしないとguest.idが決まらない
    reservation = Reservation.new({
      start_date: guest_params[:start_date],
      end_date: guest_params[:end_date],
      people: guest_params[:people],
      room_id: guest_params[:room_id],
      guest_id: guest.id,
    })
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
      notification = Notification.new(
        reservation_id: @reservation.id,
        action: "キャンセル"
      )
      notification.save
    elsif @reservation.is_flag == false
      @reservation.update(is_flag: true)
      notification = Notification.new(
        reservation_id: @reservation.id,
        action: "キャンセル→予約"
      )
      notification.save
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :people, :room_id)
  end

  def guest_params
    params.require(:guest).permit(:name, :name_kana, :birthday, :sex,
                                  :zipcode, :address, :phone_number, :email,
                                  :start_date, :end_date, :people, :room_id, :back)
  end

  # paramsからguestとreservationの情報をを分けて取り出す
  def extract_guest_params(strong_params)
    strong_params.permit(:name, :name_kana, :birthday, :sex, :zipcode, :address, :phone_number, :email)
  end

  def extract_reservation_params(strong_params)
    strong_params.permit(:start_date, :end_date, :people, :room_id)
  end
end
