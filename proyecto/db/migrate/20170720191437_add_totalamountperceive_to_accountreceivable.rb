class AddTotalamountperceiveToAccountreceivable < ActiveRecord::Migration
  def change
    add_column :accountreceivables, :totalAmountPerceive, :float
  end
end
