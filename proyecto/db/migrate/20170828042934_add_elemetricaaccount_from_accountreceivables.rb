class AddElemetricaaccountFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :elemetricaAccount, :string
  end
end
