class AddCategoryFromSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :category, :string
  end
end
