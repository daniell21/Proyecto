class PaymentMailer < ApplicationMailer
	#Este mailer es para los correos que se envian luego de que un cliente registre un pago
	#falta por terminar
	def new_payment
		@client = Client.all
		if (current_user.role == "client")
			mail(to: current_user.email , subject: "Ha Registrado un pago")
		end
	end 
end
