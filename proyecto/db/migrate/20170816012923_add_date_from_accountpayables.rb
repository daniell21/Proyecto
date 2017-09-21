class AddDateFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :date, :date
  end
end
