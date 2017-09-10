class ClientMailer < ApplicationMailer
#Esto cambia, ahora emial es una entidas debil de cliente
	default from: "danieltestrails4@gmail.com"
	def client_mail(client_mail, email)
    	@client_mail = client_mail

    mail(to: email, subject: client_mail.title)
    
  end
end
