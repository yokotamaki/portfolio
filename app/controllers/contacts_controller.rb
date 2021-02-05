class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    contact = Contact.new(contact_params)
    contact.save
    redirect_to success_contacts_path
  end

  def success
  end

  private
  def contact_params
    params.require(:contact).permit(:title, :body, :name, :email)
  end
end
