class NotificationMailer < ApplicationMailer
  # 予約完了メール
  def success_mail(guest)
    @guest = guest
    mail(
      subject: "予約が完了しました" ,
      to: @guest.email
      )do |format|
      format.text
    end
  end
  # お問い合わせ完了メール
  def contact_success_mail(contact)
    @contact = contact
    mail(
      subject: "お問い合わせが完了しました!" ,
      to: @contact.email
      )do |format|
      format.text
    end
  end

end
