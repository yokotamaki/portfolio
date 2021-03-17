class Admin::ContactsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
    @contacts = Contact.order("#{sort_column} #{sort_direction}")
                       .page(params[:page]).per(10)
  end

  def show
    unless admin_signed_in?
      redirect_to new_admin_session_path
    end
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash.now[:notice] = "#{@contact.status}に更新しました！"
      render "success"
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:status)
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  def sort_column
    Contact.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
end
