class AddAmountwithttaxToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :amountWithtTax, :float
  end
end
