class RemoveLocalamountToSearchClients < ActiveRecord::Migration
  def change
    remove_column :search_clients, :localAmount, :integer
  end
end
