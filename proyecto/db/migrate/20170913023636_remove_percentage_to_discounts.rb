class RemovePercentageToDiscounts < ActiveRecord::Migration
  def change
    remove_column :discounts, :percentage, :float
  end
end
