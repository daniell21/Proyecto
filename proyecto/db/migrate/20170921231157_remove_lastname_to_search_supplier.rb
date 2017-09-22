class RemoveLastnameToSearchSupplier < ActiveRecord::Migration
  def change
    remove_column :search_suppliers, :lastname, :string
  end
end
