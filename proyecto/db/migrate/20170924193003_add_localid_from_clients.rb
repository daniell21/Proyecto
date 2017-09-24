class AddLocalidFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :localId, :string
  end
end
