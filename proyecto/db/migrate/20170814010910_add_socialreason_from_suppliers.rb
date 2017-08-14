class AddSocialreasonFromSuppliers < ActiveRecord::Migration
  def change
    add_column :suppliers, :socialReason, :text
  end
end
