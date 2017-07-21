class RemoveFieldTotalFromAccountreceivable < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :total, :integer
  end
end
