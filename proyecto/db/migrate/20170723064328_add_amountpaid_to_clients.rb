class AddAmountpaidToClients < ActiveRecord::Migration
  def change
    add_column :clients, :amountPaid, :float
  end
end
