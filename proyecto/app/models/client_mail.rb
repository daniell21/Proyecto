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
		
		client = Client.find(self.client_id)
		emails = client.email_ids
		
		emails.each do |email| 
			e = Email.find(email)
			ClientMailer.delay.client_mail(self, e.email)
		end

	end


end
