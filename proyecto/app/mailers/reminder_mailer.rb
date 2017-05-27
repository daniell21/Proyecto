class ReminderMailer < ApplicationMailer
	def new_sendreminder(client)
	
			mail(to: client.email, subject: "Recordatorio")
		
	end
	 
end
