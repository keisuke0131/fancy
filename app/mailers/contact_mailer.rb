class ContactMailer < ApplicationMailer
  def contact_mail(contact)
      @contact = contact
      mail(
        from: 'gobugobu0131@gmail.com',
        to:   'gottue_kanzi0131@yahoo.co.jp',
        subject: 'お問い合わせ通知'
      )
  end
end