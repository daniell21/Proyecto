class RemoveAmountpaidToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :amountPaid, :float
  end
end
