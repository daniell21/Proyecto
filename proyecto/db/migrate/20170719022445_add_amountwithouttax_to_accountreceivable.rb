class AddAmountwithouttaxToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :amountWithoutTax, :float
  end
end
