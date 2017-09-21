class AddMonthFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :month, :integer
  end
end
