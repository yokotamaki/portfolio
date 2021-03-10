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
      # 完了メールの送信
      NotificationMailer.contact_success_mail(@contact).deliver_now
      redirect_to success_contacts_path
      # 管理者へ通知
      notification = Notification.new(
        contact_id: @contact.id,
        action: "お問い合わせ"
      )
      notification.save
    end
  end

  def success
  end

  private
  def contact_params
    params.require(:contact).permit(:title, :body, :name, :email)
  end
end
