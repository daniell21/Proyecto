class RemoveTotalretentionsToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :totalRetentions, :float
  end
end
