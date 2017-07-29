class AddClientaccountToAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :clientAccount, :string
  end
end
