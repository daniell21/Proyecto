class AddBaseamountFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :baseAmount, :decimal
  end
end
