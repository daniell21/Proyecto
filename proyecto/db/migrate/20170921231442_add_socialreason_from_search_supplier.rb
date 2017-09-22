class AddSocialreasonFromSearchSupplier < ActiveRecord::Migration
  def change
    add_column :search_suppliers, :socialReason, :text
  end
end
