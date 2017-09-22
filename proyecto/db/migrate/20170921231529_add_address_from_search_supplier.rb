class AddAddressFromSearchSupplier < ActiveRecord::Migration
  def change
    add_column :search_suppliers, :address, :text
  end
end
