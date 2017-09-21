class AddPaidFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :paid, :boolean
  end
end
