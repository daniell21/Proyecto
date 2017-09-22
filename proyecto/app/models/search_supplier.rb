class SearchSupplier < ActiveRecord::Base
	def search_suppliers
		suppliers = Supplier.all

		suppliers = suppliers.where(["name LIKE ?",name]) if name.present?
		suppliers = suppliers.where(["rif LIKE ?",rif]) if rif.present?
		suppliers = suppliers.where(["email LIKE ?",email]) if email.present?
		suppliers = suppliers.where(["socialReason LIKE ?",socialReason]) if socialReason.present?
		suppliers = suppliers.where(["address LIKE ?",address]) if address.present?
		return suppliers 


	end
end
