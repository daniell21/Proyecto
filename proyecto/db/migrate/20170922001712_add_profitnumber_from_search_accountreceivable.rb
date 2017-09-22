class AddProfitnumberFromSearchAccountreceivable < ActiveRecord::Migration
  def change
    add_column :search_accountreceivables, :profitNumber, :string
  end
end
