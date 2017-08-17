class RemoveChecknumberToAccountpayables < ActiveRecord::Migration
  def change
    remove_column :accountpayables, :checkNumber, :string
  end
end
