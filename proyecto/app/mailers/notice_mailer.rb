class NoticeMailer < ApplicationMailer

	def new_notice(user)
		@user = user
				mail(to: user.email , subject: "Nuevo registro de Pago Elemétrica")
		
	end 
end
