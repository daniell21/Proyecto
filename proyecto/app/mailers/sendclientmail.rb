class Sendclientmail < ApplicationMailer
	def new_sendclientmail(client)
		@client = client
		id = client.id
		User.all.each do |user|
			mail(to: client.email, subject: Clientmail.where(:client_id => id).last.title)
		end
	end
end
