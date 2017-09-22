class RemoveSocialreasonToSearchSupplier < ActiveRecord::Migration
  def change
    remove_column :search_suppliers, :socialReason, :string
  end
end
