class SearchClient < ActiveRecord::Base
	def search_clients
		clients = Client.all

		clients = clients.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
		clients = clients.where(["rif LIKE ?",rif]) if rif.present?
		clients = clients.where(["profitCode LIKE ?",profitCode]) if profitCode.present?
		clients = clients.where(["email LIKE ?",email]) if email.present?
		clients = clients.where(["specialcontributor LIKE ?",specialcontributor]) if specialcontributor.present?
		clients = clients.where(["state LIKE ?",state]) if state.present?
		clients = clients.where(["socialReason LIKE ?",socialReason]) if socialReason.present?
		return clients
	end
end
