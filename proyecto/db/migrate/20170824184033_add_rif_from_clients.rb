class AddRifFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :rif, :string
  end
end
