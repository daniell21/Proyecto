class AddAmountpaidFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :amountPaid, :decimal, precision: 15, scale: 2
  end
end
