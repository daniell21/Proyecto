class SearchClient < ActiveRecord::Base
	
	def search_clients
		clients = Client.all

		clients = clients.where(["name LIKE ?",name]) if profitCode.present?
		clients = clients.where(["profitCode LIKE ?",profitCode]) if profitCode.present?
		clients = clients.where(["country LIKE ?",country]) if country.present?
		clients = clients.where(["rif LIKE ?",rif]) if rif.present?
		clients = clients.where(["profitCode LIKE ?",profitCode]) if profitCode.present?
		clients = clients.where(["localId LIKE ?",localId]) if localId.present?
		clients = clients.where(["specialDiscount LIKE ?",specialDiscount]) if specialDiscount.present?
		clients = clients.where(["specialcontributor LIKE ?",specialcontributor]) if specialcontributor.present?
		clients = clients.where(["state LIKE ?",state]) if state.present?
		clients = clients.where(["specialDiscount LIKE ?",specialDiscount]) if specialDiscount.present?
		clients = clients.where(["socialReason LIKE ?",socialReason]) if socialReason.present?
		return clients
	end
	
end


 

