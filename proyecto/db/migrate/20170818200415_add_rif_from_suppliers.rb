class AddRifFromSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :rif, :string
  end
end
