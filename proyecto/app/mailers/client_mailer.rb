class ClientMailer < ApplicationMailer
	#este mailer es para el envio de correos por medio del módulo de correos del sistema
#Esto cambia, ahora email es una entidas debil de cliente
	
	def client_mail(client_id, email)
	
 

    	mail(to: email, subject: client_id.title)
  	end
end
