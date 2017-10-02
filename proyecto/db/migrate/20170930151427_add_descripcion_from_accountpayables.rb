class AddDescripcionFromAccountpayables < ActiveRecord::Migration
  def change
    add_column :accountpayables, :descripcion, :text
  end
end
