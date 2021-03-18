class Admin::NotificationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @notification = Notification.new
    @notifications = Notification.all.order(id: "DESC")

    # 通知確認後checkedをtrueにする
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end

    # 絞り込み
    action = notification_search_params[:action]
    if action == "all"
      @notifications = Notification.all.order(id: "DESC")
    elsif action == "reservation"
      @notifications = Notification.where(action: ["予約", "キャンセル→予約"])
                                   .order(id: "DESC")
    elsif action == "cxl"
      @notifications = Notification.where(action: "キャンセル")
                                   .order(id: "DESC")
    elsif action == "contact"
      @notifications = Notification.where(action: "お問い合わせ")
                                   .order(id: "DESC")
    elsif action == "review"
      @notifications = Notification.where(action: "レビュー")
                                   .order(id: "DESC")
    end
  end

  private
  def notification_search_params
    params.fetch(:notification_search, {}).permit(:action)
  end
end
