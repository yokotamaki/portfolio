class NoticesController < ApplicationController
  def index
    @notices = Notice.all.order(id: "DESC")
  end

  def notice
    @notice = Notice.where(tab: "お知らせ").order(id: "DESC")
  end

  def event
    @notice = Notice.where(tab: "イベント・キャンペーン").order(id: "DESC")
  end

  def other
    @notice = Notice.where(tab: "その他").order(id: "DESC")
  end

  def show
    @notice = Notice.find(params[:id])
  end
end
