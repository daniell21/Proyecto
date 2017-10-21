class AddLocalidFromSearchClients < ActiveRecord::Migration
  def change
    add_column :search_clients, :localId, :string
  end
end
