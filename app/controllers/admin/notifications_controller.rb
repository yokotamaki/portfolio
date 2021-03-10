class Admin::NotificationsController < ApplicationController
  def index
    @notifications = Notification.all.order(id: "DESC")
  end
end
