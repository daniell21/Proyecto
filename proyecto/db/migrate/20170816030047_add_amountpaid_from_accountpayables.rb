class AddAmountpaidFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :amountPaid, :float
  end
end
