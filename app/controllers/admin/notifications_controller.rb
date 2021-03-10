class Admin::NotificationsController < ApplicationController
  def index
    @notifications = Notification.all.order(id: "DESC")
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
