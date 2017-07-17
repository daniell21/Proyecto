class CreateJoinTableSupplierGroup < ActiveRecord::Migration
  def change
    create_join_table :Suppliers, :Groups do |t|
      t.index [:supplier_id, :group_id]
      t.index [:group_id, :supplier_id]
    end
  end
end
