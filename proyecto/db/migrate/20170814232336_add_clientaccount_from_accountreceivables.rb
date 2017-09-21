class AddClientaccountFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :clientAccount, :string
  end
end
