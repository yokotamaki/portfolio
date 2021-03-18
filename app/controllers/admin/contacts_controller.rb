class Admin::ContactsController < ApplicationController
  before_action :authenticate_admin!
  helper_method :sort_column, :sort_direction

  def index
    @contacts = Contact.order("#{sort_column} #{sort_direction}")
                       .page(params[:page]).per(10)
  end

  def show
    @contact = Contact.find(params[:id])
  rescue
    redirect_to admin_contacts_path
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
