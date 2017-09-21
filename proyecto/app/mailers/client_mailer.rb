class ClientMailer < ApplicationMailer
	#este mailer es para el envio de correos por medio del módulo de correos del sistema
#Esto cambia, ahora email es una entidas debil de cliente
	
	def client_mail(client_mail, email)
	
    	@client_mail = client_mail
    	@client = Client.find(@client_mail.client_id)
    	mail(to: email, subject: client_mail.title)
  	end
end
