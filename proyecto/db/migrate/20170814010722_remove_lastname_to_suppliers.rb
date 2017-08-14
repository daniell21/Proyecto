class RemoveLastnameToSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :lastname, :string
  end
end
