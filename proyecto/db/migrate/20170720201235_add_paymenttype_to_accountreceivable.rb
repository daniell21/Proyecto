class AddPaymenttypeToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :paymentType, :string
  end
end
