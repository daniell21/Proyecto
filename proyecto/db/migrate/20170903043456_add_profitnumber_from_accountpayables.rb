class AddProfitnumberFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :profitNumber, :string
  end
end
