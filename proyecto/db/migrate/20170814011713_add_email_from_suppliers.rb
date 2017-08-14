class AddEmailFromSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :email, :string
  end
end
