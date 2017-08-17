class AddChecknumberFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :checkNumber, :string
  end
end
