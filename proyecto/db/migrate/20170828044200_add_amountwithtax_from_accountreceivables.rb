class AddAmountwithtaxFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :amountWithTax, :decimal
  end
end
