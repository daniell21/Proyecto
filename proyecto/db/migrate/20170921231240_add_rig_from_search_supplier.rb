class AddRigFromSearchSupplier < ActiveRecord::Migration
  def change
    add_column :search_suppliers, :rif, :string
  end
end
