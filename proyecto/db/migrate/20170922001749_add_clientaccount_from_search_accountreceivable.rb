class AddClientaccountFromSearchAccountreceivable < ActiveRecord::Migration
  def change
    add_column :search_accountreceivables, :clientAccount, :string
  end
end
