class AddTransfernumberToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :transferNumber, :integer
  end
end
