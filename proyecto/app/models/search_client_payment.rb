class SearchClientPayment < ApplicationRecord
	validates :keywords, presence: true
	validates_numericality_of :keywords
	def search_client_payments
		clients = Client.all

		clients = clients.where(["rif LIKE ?","%#{keywords}%"]) if keywords.present?
		return clients
	end
end
