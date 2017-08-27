class AddRateIdToAccountreceivables < ActiveRecord::Migration
  def change
    add_reference :accountreceivables, :rate, index: true, foreign_key: true
  end
end
