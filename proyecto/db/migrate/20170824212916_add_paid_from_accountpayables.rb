class AddPaidFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :paid, :boolean
  end
end
