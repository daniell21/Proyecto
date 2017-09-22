class AddLocalamountFromSearchClient < ActiveRecord::Migration
  def change
    add_column :search_clients, :localAmount, :integer
  end
end
