class AddDepositnumberFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :depositNumber, :string
  end
end
