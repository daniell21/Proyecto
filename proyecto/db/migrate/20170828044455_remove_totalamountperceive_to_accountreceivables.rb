class RemoveTotalamountperceiveToAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :totalAmountPerceive, :float
  end
end
