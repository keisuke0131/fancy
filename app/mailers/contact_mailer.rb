class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact  
    mail to: "gottue_kanzi0131@yahoo.co.jp", subject: "メールのタイトル"
  end
end

