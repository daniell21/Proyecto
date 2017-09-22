class AddTransfernumberclientFromSearchAccountreceivable < ActiveRecord::Migration
  def change
    add_column :search_accountreceivables, :transferNumberClient, :string
  end
end
