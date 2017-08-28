class AddAmountwithouttaxFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :amountWithoutTax, :decimal
  end
end
