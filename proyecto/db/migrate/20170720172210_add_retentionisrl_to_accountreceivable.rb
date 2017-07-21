class AddRetentionisrlToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :retentionIsrl, :boolean
  end
end
