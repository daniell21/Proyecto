class RemovePaidToAccountpayables < ActiveRecord::Migration
  def change
    remove_column :accountpayables, :paid, :boolean
  end
end
