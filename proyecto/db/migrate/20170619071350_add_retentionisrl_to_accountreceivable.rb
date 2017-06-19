class AddRetentionisrlToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :retentionisrl, :integer
  end
end
