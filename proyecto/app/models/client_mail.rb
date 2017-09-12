class ClientMail < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true

	#after_create :send_reminder
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
		@client = client
		emails.each do |email| 
			e = Email.find(email)
			ClientMailer.delay.client_mail(self, e.email)
		end

	end
# 	def send_reminder
		
 
#     clients = Client.all

#   clients.each do |client|
#         ReminderMailer.delay.new_sendreminder(client)
# #       if client.chargeMonthlyFee
# #       id = Accountreceivable.last.id + 1
# #       puts id
# #       @accountreceivable = Accountreceivable.new
# #             @accountreceivable.id = id
# #             @accountreceivable.client_id = client.id
# #             @accountreceivable.status = "facturada"
# #             @accountreceivable.concept = "mensualidad"
# #             @accountreceivable.paid = "no"
# #             @accountreceivable.month = "enero"
# #             @accountreceivable.save
#        end
		
# 	end



end
