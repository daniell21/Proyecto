class SearchAccountpayable < ApplicationRecord
	def search_accountpayables
		accountpayables = Accountpayable.all

		accountpayables = accountpayables.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
		accountpayables = accountpayables.where(["date LIKE ?",date]) if date.present?
		accountpayables = accountpayables.where(["descripcion LIKE ?",descripcion]) if descripcion.present?
		return accountpayables
	end
end
