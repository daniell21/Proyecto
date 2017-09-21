class ReminderMailer < ApplicationMailer
	#Este mailer es para los recordatorios de pago periodicos
	#falta por terminar
	def new_sendreminder(client) 
		@client = client  
		emails = client.email_ids
		@client = client 
		emails.each do |email| 
			e = Email.find(email)
			mail(to: "daniellorente20@gmail.com", subject: "Elemétrica te recuerda realizar tus pagos pendientes")
		end
			
		
	end
end
