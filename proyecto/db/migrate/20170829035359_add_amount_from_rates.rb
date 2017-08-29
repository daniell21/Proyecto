class AddAmountFromRates < ActiveRecord::Migration
  def change
    add_column :rates, :amount, :decimal, precision: 15, scale: 2
  end
end
