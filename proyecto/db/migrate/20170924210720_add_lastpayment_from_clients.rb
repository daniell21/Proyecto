class AddLastpaymentFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :lastPayment, :date
  end
end
