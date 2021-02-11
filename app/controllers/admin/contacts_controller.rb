class Admin::ContactsController < ApplicationController
  def index
    @contacts = Contact.page(params[:page]).all.per(15)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      redirect_to request.referer
      flash[:notice] = "対応状況を更新しました！"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:status)
  end

end
