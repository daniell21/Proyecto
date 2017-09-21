class AddTransfernumberclientFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :transferNumberClient, :string
  end
end
