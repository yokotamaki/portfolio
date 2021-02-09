class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  # def success_mail(guest)
  #   @guest = guest
  #   mail(
  #     subject: "予約が完了しました" ,
  #     to: @guest.email
  #     )do |format|
  #     format.text
  #   end
  # end

end
