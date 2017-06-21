class AddRifToClient < ActiveRecord::Migration
  def change
    add_column :clients, :rif, :integer
  end
end
