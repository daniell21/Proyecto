class AddAmountpaidToAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :amountPaid, :float
  end
end
