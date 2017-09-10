class RemoveLocalAmountToClients < ActiveRecord::Migration
  def change
    remove_column :clients, :localAmount, :string
  end
end
