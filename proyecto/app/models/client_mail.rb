class ClientMail < ActiveRecord::Base
  belongs_to :client

	after_create :send_mail
	after_create :setDate
	after_save :setDate

	def setDate
		self.update_column(:date, Time.now.strftime("%Y-%m-%d"))
		
	end
	private	
	
	def send_mail
		#raise self.client.to_yaml
		ClientMailer.delay.client_mail(self)

	end


end
