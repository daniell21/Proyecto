class AddBankToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :bank, :string
  end
end
