class AddMonthFromSearchAccountreceivable < ActiveRecord::Migration
  def change
    add_column :search_accountreceivables, :month, :integer
  end
end
