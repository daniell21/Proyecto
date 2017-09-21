class PaymentMailer < ApplicationMailer
	#Este mailer es para los correos que se envian luego de que un cliente registre un pago
	#falta por terminar
	def new_payment(email)
	


				mail(to: email , subject: "Ha Registrado un pago")
		
	end 
end
