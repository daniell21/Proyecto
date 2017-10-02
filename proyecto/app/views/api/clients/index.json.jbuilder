json.clients @clients do |client|
	json.id client.localId
	json.name client.name
	json.lastPayment client.lastPayment
end