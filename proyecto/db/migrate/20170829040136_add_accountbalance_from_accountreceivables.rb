class AddAccountbalanceFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :accountBalance, :decimal, precision: 15, scale: 2
  end
end
