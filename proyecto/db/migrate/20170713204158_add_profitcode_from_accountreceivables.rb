class AddProfitcodeFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :profitCode, :string
  end
end
