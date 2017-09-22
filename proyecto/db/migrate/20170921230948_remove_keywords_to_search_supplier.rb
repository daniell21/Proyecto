class RemoveKeywordsToSearchSupplier < ActiveRecord::Migration
  def change
    remove_column :search_suppliers, :keywords, :string
  end
end
