class AddTotalamountperceiveFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :totalAmountPerceive, :decimal, precision: 15, scale: 2
  end
end
