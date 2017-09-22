class AddChargemonthlyfeeFromSearchClient < ActiveRecord::Migration
  def change
    add_column :search_clients, :chargeMonthlyFee, :boolean
  end
end
