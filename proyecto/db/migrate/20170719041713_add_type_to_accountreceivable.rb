class AddTypeToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :type, :string
  end
end
