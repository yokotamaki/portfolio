module NotificationsHelper
  # 未確認の通知
  def not_checked_notifications
    @notifications = Notification.where(checked: false)
  end
end
