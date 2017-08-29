class RemoveAmountwithtaxToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :amountWithTax, :decimal
  end
end
