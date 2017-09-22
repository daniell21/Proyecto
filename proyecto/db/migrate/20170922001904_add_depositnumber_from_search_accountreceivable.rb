class AddDepositnumberFromSearchAccountreceivable < ActiveRecord::Migration
  def change
    add_column :search_accountreceivables, :depositNumber, :string
  end
end
