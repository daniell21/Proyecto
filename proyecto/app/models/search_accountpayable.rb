class SearchAccountpayable < ActiveRecord::Base
	def search_accountpayables
		accountpayables = Accountpayable.all

		#accountpayables = accountpayables.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
		
		accountpayables = accountpayables.where(["amountPaid LIKE ?",amountPaid]) if amountPaid.present?
		accountpayables = accountpayables.where(["descripcion LIKE ?",descripcion]) if descripcion.present?
		accountpayables = accountpayables.where(["supplier_id LIKE ?",supplier_id]) if supplier_id.present?
		accountpayables = accountpayables.where(["profitNumber LIKE ?",profitNumber]) if profitNumber.present?

		return accountpayables
	end
end
