class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      NotificationMailer.contact_success_mail(contact).deliver_now
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
