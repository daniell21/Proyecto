class AddAccountbalanceFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :accountBalance, :float
  end
end
