class AddRetentionivaToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :retentioniva, :integer
  end
end
