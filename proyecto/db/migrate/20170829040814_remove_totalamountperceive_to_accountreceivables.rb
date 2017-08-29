class RemoveTotalamountperceiveToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :totalAmountPerceive, :decimal
  end
end
