class AddAmountpaidFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :amountPaid, :string
  end
end
