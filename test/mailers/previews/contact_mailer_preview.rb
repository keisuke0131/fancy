# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def contact
    contact = Contact.new(name: "ぴよ太郎",email: "e1n18053@oit.ac.jp", message: "問い合わせメッセージ")

    ContactMailer.send_mail(contact)
  end
end
