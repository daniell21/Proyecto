class AddClientFromSearchClient < ActiveRecord::Migration
  def change
    add_column :search_clients, :name, :string
  end
end
