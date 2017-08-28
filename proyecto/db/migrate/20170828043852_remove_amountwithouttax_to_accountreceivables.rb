class RemoveAmountwithouttaxToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :amountWithoutTax, :float
  end
end
