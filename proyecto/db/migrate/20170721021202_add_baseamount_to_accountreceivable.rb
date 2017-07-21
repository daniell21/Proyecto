class AddBaseamountToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :baseAmount, :float
  end
end
