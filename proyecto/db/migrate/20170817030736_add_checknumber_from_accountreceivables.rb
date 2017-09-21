class AddChecknumberFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :checkNumber, :string
  end
end
