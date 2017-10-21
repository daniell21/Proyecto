class AdminMailer < ApplicationMailer
#Este mailer es para los usuarios admin del sistema, para que se envíen periodicamente recordatorios sobre tareas 
#pendientes del sistema
	#falta por terminar
	def new_adminreminder
		
	    users = User.all
	    users.each do |user|
		    if user.role == "admin"
		      mail(to: user.email, subject: "Recordatorios Administracion Sistema de Cobranza")
		    end
		end
			
		
	end 
end
 