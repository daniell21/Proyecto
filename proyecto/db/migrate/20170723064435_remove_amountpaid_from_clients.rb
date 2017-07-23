class RemoveAmountpaidFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :amountPaid, :float
  end
end
