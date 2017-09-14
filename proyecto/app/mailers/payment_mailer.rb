class PaymentMailer < ApplicationMailer
	#Este mailer es para los correos que se envian luego de que un cliente registre un pago
	#falta por terminar
	def new_payment
		@client = Client.all
			mail(to: "daniellorente20@gmail.com", subject: "Recordatorio wqSistema de Cobranza")
		
	end 
end
