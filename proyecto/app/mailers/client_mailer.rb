class ClientMailer < ApplicationMailer
	def new_client(client)
		@client = client

		User.all.each do |user|
			mail(to: client.email, subject: "Administracion Elemétrica")
        end			
	end
end
