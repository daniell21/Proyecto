class AddProfitcodeToClient < ActiveRecord::Migration
  def change
    add_column :clients, :profitCode, :string
  end
end
