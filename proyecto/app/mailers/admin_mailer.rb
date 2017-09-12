class AdminMailer < ApplicationMailer
#Este mailer es para los usuarios admin del sistema, para que se envíen periodicamente recordatorios sobre tareas 
#pendientes del sistema
	#falta por terminar
	def new_adminreminder
		@user = User.all
			mail(to: "daniellorente20@gmail.com", subject: "Recordatorio Sistema de Cobranza")
		
	end 
end
 