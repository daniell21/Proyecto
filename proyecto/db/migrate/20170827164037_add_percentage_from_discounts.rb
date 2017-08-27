class AddPercentageFromDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :percentage, :decimal
  end
end
