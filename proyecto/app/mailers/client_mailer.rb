class ClientMailer < ApplicationMailer
	default from: "danieltestrails4@gmail.com"
	def client_mail(client_mail)
    @client_mail = client_mail
    @client = Client.find(@client_mail.client_id)
    mail(to: @client.email, subject: @client_mail.title)
    
  end
end
