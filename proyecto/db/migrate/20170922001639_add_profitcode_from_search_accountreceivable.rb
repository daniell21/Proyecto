class AddProfitcodeFromSearchAccountreceivable < ActiveRecord::Migration
  def change
    add_column :search_accountreceivables, :profitCode, :string
  end
end
