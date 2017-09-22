class AddElemetricaaccountFromSearchAccountreceivable < ActiveRecord::Migration
  def change
    add_column :search_accountreceivables, :elemetricaAccount, :string
  end
end
