class AddStatusToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :status, :string
  end
end
