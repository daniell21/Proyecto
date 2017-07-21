class AddTotalretentionsToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :totalRetentions, :float
  end
end
