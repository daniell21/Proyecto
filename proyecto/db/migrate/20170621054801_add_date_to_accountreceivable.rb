class AddDateToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :date, :date
  end
end
