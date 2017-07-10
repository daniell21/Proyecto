class RemoveLastnameFromClients < ActiveRecord::Migration
  def change
    remove_column :clients, :lastame, :string
  end
end
