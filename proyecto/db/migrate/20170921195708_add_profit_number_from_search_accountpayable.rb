class AddProfitNumberFromSearchAccountpayable < ActiveRecord::Migration
  def change
    add_column :search_accountpayables, :profitNumber, :string
  end
end
