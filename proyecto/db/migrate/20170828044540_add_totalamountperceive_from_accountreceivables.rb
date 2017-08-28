class AddTotalamountperceiveFromAccountreceivables < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :totalAmountPerceive, :decimal
  end
end
