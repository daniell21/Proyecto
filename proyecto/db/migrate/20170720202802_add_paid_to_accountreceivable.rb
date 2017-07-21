class AddPaidToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :paid, :string
  end
end
