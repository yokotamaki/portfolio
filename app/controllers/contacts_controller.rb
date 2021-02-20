class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    @contact.valid?
    if @contact.errors.present?
      return render "new"
    end
  end

  def create
    @contact = Contact.new(contact_params)
    render :new and return if params[:back]
    if @contact.save
      NotificationMailer.contact_success_mail(@contact).deliver_now
      redirect_to success_contacts_path
    end
  end

  def success
  end

  private
  def contact_params
    params.require(:contact).permit(:title, :body, :name, :email)
  end
end
