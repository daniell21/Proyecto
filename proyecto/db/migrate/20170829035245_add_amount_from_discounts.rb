class AddAmountFromDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :amount, :decimal, precision: 15, scale: 2
  end
end
