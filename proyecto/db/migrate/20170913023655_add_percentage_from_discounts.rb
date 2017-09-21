class AddPercentageFromDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :percentage, :decimal, precision: 5, scale: 2
  end
end
