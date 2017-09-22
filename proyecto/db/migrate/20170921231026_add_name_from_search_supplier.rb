class AddNameFromSearchSupplier < ActiveRecord::Migration
  def change
    add_column :search_suppliers, :name, :string
  end
end
