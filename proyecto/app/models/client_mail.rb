class ClientMail < ActiveRecord::Base
  belongs_to :client
  validates :title, presence: true
  validates :body, presence: true
  validates :client_id, presence: true, if: :emptyMassMailings? 
	#after_create :send_reminder
	after_create :send_mail
	after_create :setDate
	after_save :setDate

	def setDate
		self.update_column(:date, Time.now.strftime("%Y-%m-%d"))
		
	end


	def emptyMassMailings?
		if massMailings
			return false
		else
			return true
		end
	end
	private	
	
	def send_mail
		if massMailings
			c = Client.all
			c.each do |client|
				emails = client.email_ids

				emails.each do |email| 
					e = Email.find(email)
					ClientMailer.delay.client_mail(self, e.email)
				end
			end

		else
		
			client = Client.find(self.client_id)
			emails = client.email_ids
			@client = client
			ReminderMailer.delay.new_sendreminder(self)
			emails.each do |email| 
				
				e = Email.find(email)

				ClientMailer.delay.client_mail(self, e.email)

			end
		end
			AdminMailer.delay.new_adminreminder

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
