class RemoveSpecialcontributorToSearchClient < ActiveRecord::Migration
  def change
    remove_column :search_clients, :specialcontributor, :string
  end
end
