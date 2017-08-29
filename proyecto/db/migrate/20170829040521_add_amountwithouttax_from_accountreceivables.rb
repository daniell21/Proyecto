class AddAmountwithouttaxFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :amountWithoutTax, :decimal, precision: 15, scale: 2
  end
end
