class ClientMailer < ApplicationMailer
	default from: "danieltestrails4@gmail.com"
	def client_mail(client_mail)
    @client_mail = client_mail
    mail(to: @client_mail.destinatary, subject: @client_mail.title)
  end
end
