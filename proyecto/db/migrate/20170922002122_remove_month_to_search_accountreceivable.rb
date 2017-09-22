class RemoveMonthToSearchAccountreceivable < ActiveRecord::Migration
  def change
    remove_column :search_accountreceivables, :month, :string
  end
end
