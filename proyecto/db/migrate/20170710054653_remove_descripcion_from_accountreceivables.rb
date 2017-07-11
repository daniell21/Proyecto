class RemoveDescripcionFromAccountreceivables < ActiveRecord::Migration
  def change
    remove_column :accountreceivables, :descripcion, :string
  end
end
