class AddTransfernumberFromSearchAccountreceivable < ActiveRecord::Migration
  def change
    add_column :search_accountreceivables, :transferNumber, :string
  end
end
