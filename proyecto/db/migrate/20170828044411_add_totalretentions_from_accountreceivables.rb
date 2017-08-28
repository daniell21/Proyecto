class AddTotalretentionsFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :totalRetentions, :decimal
  end
end
