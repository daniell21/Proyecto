class SearchSupplier < ActiveRecord::Base
	def search_suppliers
		suppliers = Supplier.all

		suppliers = suppliers.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
		suppliers = suppliers.where(["lastname LIKE ?",lastname]) if lastname.present?
		suppliers = suppliers.where(["email LIKE ?",email]) if email.present?
		return suppliers
	end
end
