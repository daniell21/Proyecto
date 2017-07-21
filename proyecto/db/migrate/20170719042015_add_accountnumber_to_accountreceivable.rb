class AddAccountnumberToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :accountNumber, :integer
  end
end
