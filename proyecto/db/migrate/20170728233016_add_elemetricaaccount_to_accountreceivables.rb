class AddElemetricaaccountToAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :elemetricaAccount, :bigint
  end
end
