class AddChargemonthlyfeeFromClients < ActiveRecord::Migration
  def change
    add_column :clients, :chargeMonthlyFee, :boolean
  end
end
