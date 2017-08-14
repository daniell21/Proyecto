class AddRifFromSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :rif, :integer
  end
end
