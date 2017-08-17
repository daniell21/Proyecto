class AddDepositnumberFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :depositNumber, :string
  end
end
