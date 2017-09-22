class AddSpecialcontributorFromSearchClient < ActiveRecord::Migration
  def change
    add_column :search_clients, :specialcontributor, :boolean
  end
end
