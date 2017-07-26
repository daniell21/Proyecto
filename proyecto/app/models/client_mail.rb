class ClientMail < ActiveRecord::Base
  belongs_to :client

	after_create :send_mail

	private	
	
	def send_mail
		
		ClientMailer.delay.client_mail(self)

	end
end
