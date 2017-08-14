class RemoveEmailToSuppliers < ActiveRecord::Migration
  def change
    remove_column :suppliers, :email, :text
  end
end
