class AddAmountpaidFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :amountPaid, :decimal
  end
end
