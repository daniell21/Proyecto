class NoticeMailer < ApplicationMailer

	def new_notice(user, accountreceivable)
		@user = user
		@accountreceivable = accountreceivable
		mail(to: user.email , subject: "Nuotificacion Registro de pago " + @accountreceivable.client.name)	
	end 
end
