class AddRetentionivaToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :retentionIva, :boolean
  end
end
