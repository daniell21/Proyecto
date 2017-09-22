class AddAmountpaidFromSearchAccountpayable < ActiveRecord::Migration
  def change
    add_column :search_accountpayables, :amountPaid, :decimal, precision: 15, scale: 2
  end
end
