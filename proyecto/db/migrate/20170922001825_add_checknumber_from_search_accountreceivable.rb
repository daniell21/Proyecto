class AddChecknumberFromSearchAccountreceivable < ActiveRecord::Migration
  def change
    add_column :search_accountreceivables, :checkNumber, :string
  end
end
