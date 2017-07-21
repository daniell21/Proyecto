class AddMonthToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :month, :string
  end
end
