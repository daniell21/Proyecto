class SearchAccountreceivable < ActiveRecord::Base
	def search_accountreceivables
		accountreceivables = Accountreceivable.all

		accountreceivables = accountreceivables.where(["bank LIKE ?", bank]) if bank.present?
	
		accountreceivables = accountreceivables.where(["date LIKE ?",date]) if date.present?
		accountreceivables = accountreceivables.where(["paymentType LIKE ?",paymentType]) if paymentType.present?
		accountreceivables = accountreceivables.where(["status LIKE ?",status]) if status.present?
		accountreceivables = accountreceivables.where(["bank LIKE ?",bank]) if bank.present?
		accountreceivables = accountreceivables.where(["paid LIKE ?",paid]) if paid.present?
		accountreceivables = accountreceivables.where(["month  LIKE ?",month ]) if month.present?
		accountreceivables = accountreceivables.where(["profitCode  LIKE ?",profitCode ]) if profitCode.present?
		accountreceivables = accountreceivables.where(["profitNumber  LIKE ?",profitNumber ]) if profitNumber.present?
		accountreceivables = accountreceivables.where(["checkNumber  LIKE ?",checkNumber ]) if checkNumber.present?
		accountreceivables = accountreceivables.where(["depositNumber  LIKE ?",depositNumber ]) if depositNumber.present?
		accountreceivables = accountreceivables.where(["transferNumberClient  LIKE ?",transferNumberClient ]) if transferNumberClient.present?
		accountreceivables = accountreceivables.where(["month  LIKE ?",month ]) if month.present?
		accountreceivables = accountreceivables.where(["transferNumber  LIKE ?",transferNumber ]) if transferNumber.present?
		accountreceivables = accountreceivables.where(["elemetricaAccount  LIKE ?",elemetricaAccount ]) if elemetricaAccount.present?
		accountreceivables = accountreceivables.where(["amountPaid  LIKE ?",amountPaid ]) if amountPaid.present?
		accountreceivables = accountreceivables.where(["clientAccount  LIKE ?",clientAccount ]) if clientAccount.present?
		return accountreceivables
	end
end
  