class ClientMail < ActiveRecord::Base
	after_save :send_mail

	private	
	def send_mail
	
		ClientMailer.delay.client_mail(self)

	end
end


