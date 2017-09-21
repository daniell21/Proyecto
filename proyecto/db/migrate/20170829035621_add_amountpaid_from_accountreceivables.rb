class AddAmountpaidFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :amountPaid, :decimal, precision: 15, scale: 2
  end
end
