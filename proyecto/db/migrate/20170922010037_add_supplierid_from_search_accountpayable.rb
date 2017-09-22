class AddSupplieridFromSearchAccountpayable < ActiveRecord::Migration
  def change
    add_column :search_accountpayables, :supplier_id, :integer
  end
end
