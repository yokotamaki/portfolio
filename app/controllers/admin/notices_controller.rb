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

    # 絞り込み
    tab = notice_search_params[:tab]
    if tab == "全て"
      @notices = Notice.all.order(id: "DESC")
    elsif tab == "お知らせ"
      @notices = Notice.where(tab: "お知らせ")
                                   .order(id: "DESC")
    elsif tab == "ホテル"
      @notices = Notice.where(tab: "ホテル")
                                   .order(id: "DESC")
    elsif tab == "イベント・キャンペーン"
      @notices = Notice.where(tab: "イベント・キャンペーン")
                                   .order(id: "DESC")
    elsif tab == "その他"
      @notices = Notice.where(tab: "その他")
                                   .order(id: "DESC")
    end
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
      redirect_to edit_admin_notice_path(notice), notice: "　更新に成功しました！　"
    end
  end

  def destroy
    notice = Notice.find(params[:id])
    notice.destroy
    redirect_to admin_notices_path
  end

  private

  def notice_params
    params.require(:notice).permit(:title, :body, :tab, images: [])
  end

  def notice_search_params
    params.fetch(:notice_search, {}).permit(:tab)
  end
end
