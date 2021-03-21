class Admin::NoticesController < ApplicationController
  before_action :authenticate_admin!

  def new
    @notice = Notice.new
  end

  def create
    notice = Notice.new(notice_params)
    notice.save
    redirect_to admin_notices_path
  end

  def index
    @notices = Notice.all.order(id: "DESC")
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :body, :tag, images: [])
  end
end
