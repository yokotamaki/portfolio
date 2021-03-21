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

  def edit
    @notice = Notice.find(params[:id])
  end

  def update
    notice = Notice.find(params[:id])
    # 画像の削除
    if params[:notice][:image_ids]
      params[:notice][:image_ids].each do |image_id|
        image = notice.images.find(image_id)
        image.purge
      end
    end
    if notice.update(notice_params)
      redirect_to edit_admin_notice_path(notice)
    end
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :body, :tag, images: [])
  end
end
