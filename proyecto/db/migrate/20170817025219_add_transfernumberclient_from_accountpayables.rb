class AddTransfernumberclientFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :transferNumberClient, :string
  end
end
