class RemoveAmountwithouttaxToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :amountWithoutTax, :decimal
  end
end
