class ClientMailer < ApplicationMailer
	def new_client(client)
		@client = client

		User.all.each do |user|
			mail(to: client.email, subject: "Has sido registrado por el administrador en el sistema")
        end			
	end
end