class RemoveAmountwithttaxToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :amountWithtTax, :float
  end
end
