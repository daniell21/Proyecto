class RemoveCategoryToSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :category, :string
  end
end
