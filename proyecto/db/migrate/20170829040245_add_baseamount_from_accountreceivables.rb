class AddBaseamountFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :baseAmount, :decimal, precision: 15, scale: 2
  end
end
