class RemoveTypeToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :type, :string
  end
end
