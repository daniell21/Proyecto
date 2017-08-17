class RemoveTransfernumberclientToAccountpayables < ActiveRecord::Migration
  def change
    remove_column :accountpayables, :transferNumberClient, :string
  end
end
