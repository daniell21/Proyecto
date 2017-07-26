class Sendclientmail < ApplicationMailer
	def new_sendclientmail(client_mail)
		raise client_mail.to_yaml
		@client_mail = client_mail
		id = client_mail.id
		#User.all.each do |user|
			raise client_mail.destinatary.to_yaml
			#mail(to: client_mail.destinatary, subject: "Hola")
		#end
	end
end
