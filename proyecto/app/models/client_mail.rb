class ClientMail < ActiveRecord::Base
  belongs_to :client

	after_create :send_mail
	after_create :setDate
	private	
	def setDate
		self.update_column(:date, Time.now.strftime("%Y-%d-%m %H:%M:%S %Z"))
		
	end
	def send_mail
		#raise self.client.to_yaml
		ClientMailer.delay.client_mail(self)

	end


end
