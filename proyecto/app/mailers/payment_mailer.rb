class PaymentMailer < ApplicationMailer
	#Este mailer es para los correos que se envian luego de que un cliente registre un pago
	#falta por terminar
	def new_payment(accountreceivable, client, email)
		@client = client
		@accountreceivable = accountreceivable

				mail(to: email , subject: "registro de Pago Elemétrica")
		
	end 
end
