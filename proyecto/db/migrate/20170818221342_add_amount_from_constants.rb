class AddAmountFromConstants < ActiveRecord::Migration
  def change
    add_column :constants, :amount, :string
  end
end
