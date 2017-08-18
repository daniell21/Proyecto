class AddLocalamountFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :localAmount, :string
  end
end
