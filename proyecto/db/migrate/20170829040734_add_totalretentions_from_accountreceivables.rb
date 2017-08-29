class AddTotalretentionsFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :totalRetentions, :decimal, precision: 15, scale: 2
  end
end
