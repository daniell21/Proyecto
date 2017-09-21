class AddProfitnumberToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :profitNumber, :string
  end
end
