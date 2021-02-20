class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
  end

  def create
    # 戻るボタン
    @contact = Contact.new(contact_params)
    render :new and return if params[:back]

    @contact = Contact.new(contact_params)
    if @contact.save
      NotificationMailer.contact_success_mail(@contact).deliver_now
      redirect_to success_contacts_path
    else
      render "new"
    end
  end

  def success
  end

  private
  def contact_params
    params.require(:contact).permit(:title, :body, :name, :email)
  end
end
