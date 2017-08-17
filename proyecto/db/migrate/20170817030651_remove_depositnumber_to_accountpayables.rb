class RemoveDepositnumberToAccountpayables < ActiveRecord::Migration
  def change
    remove_column :accountpayables, :depositNumber, :string
  end
end
