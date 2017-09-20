class SearchAccountreceivable < ApplicationRecord
	def search_accountreceivables
		accountreceivables = Accountreceivable.all

		accountreceivables = accountreceivables.where(["name LIKE ?","%#{keywords}%"]) if keywords.present?
		accountreceivables = accountreceivables.where(["date LIKE ?",date]) if date.present?
		accountreceivables = accountreceivables.where(["paymentType LIKE ?",paymentType]) if paymentType.present?
		accountreceivables = accountreceivables.where(["status LIKE ?",status]) if status.present?
		accountreceivables = accountreceivables.where(["bank LIKE ?",bank]) if bank.present?
		accountreceivables = accountreceivables.where(["paid LIKE ?",paid]) if paid.present?
		accountreceivables = accountreceivables.where(["month  LIKE ?",month ]) if month .present?
		return accountreceivables
	end
end
