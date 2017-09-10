class AddLocalamountFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :localAmount, :integer
  end
end
