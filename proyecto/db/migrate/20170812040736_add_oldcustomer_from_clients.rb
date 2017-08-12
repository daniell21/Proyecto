class AddOldcustomerFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :oldCustomer, :boolean
  end
end
