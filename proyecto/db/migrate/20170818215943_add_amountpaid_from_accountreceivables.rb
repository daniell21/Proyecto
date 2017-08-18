class AddAmountpaidFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :amountPaid, :string
  end
end
