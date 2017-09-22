class AddAmountpaidFromSearchAccountreceivable < ActiveRecord::Migration
  def change
    add_column :search_accountreceivables, :amountPaid, :decimal, precision: 15, scale: 2
  end
end
