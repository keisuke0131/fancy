class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact  
    mail to: ENV['EMAIL'], subject: "メールのタイトル"
  end
end

