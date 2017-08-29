class AddAmountwithtaxFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :amountWithTax, :decimal, precision: 15, scale: 2
  end
end
