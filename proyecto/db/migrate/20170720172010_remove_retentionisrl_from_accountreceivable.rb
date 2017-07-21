class RemoveRetentionisrlFromAccountreceivable < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :retentionIsrl, :integer
  end
end
