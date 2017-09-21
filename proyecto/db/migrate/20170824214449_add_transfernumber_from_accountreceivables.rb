class AddTransfernumberFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :transferNumber, :string
  end
end
